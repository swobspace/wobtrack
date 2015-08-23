#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-

ENV['RAILS_ENV'] ||= 'development'
require File.dirname(__FILE__) + '/../config/environment.rb'

require 'geocoder'
require 'mygpx'

file = ARGV[0]

unless (File.readable?("#{file}"))
  puts "File #{file} not readable"
  exit 1
end

gpx = MyGPX::File.new(file: file)

puts "time:        #{gpx.time}"
puts "creator:     #{gpx.creator}"
puts "version:     #{gpx.version}"
puts "meta:        #{gpx.meta}"
puts "track count: #{gpx.tracks.count}"
puts ""

gpx.tracks.each_with_index do |track,idx|
  puts "--- Track: #{idx} - #{track.name}"

  lastpt = nil
  dist_sum = 0
  track.trackpoints.each_with_index do |pt,idx|
    lastpt = pt if (idx == 0)
    # next unless (idx % 5 == 0)
    distance = Geocoder::Calculations.distance_between(lastpt.latlon, pt.latlon, units: :km) * 1000
    dist_sum += distance
    timediff = pt.time - lastpt.time
    height   = pt.elevation - lastpt.elevation
    velocity = (distance.to_d / timediff.to_d) * 3.6

    puts sprintf('%03d', idx) + "\t#{pt}\t" + 
         sprintf("%7.2f\t%7.3f\t%7.2f\t%6.2f", distance, timediff, height, velocity)
    lastpt = pt
  end
  puts "Entfernung: #{dist_sum}"
end

Track.import_gpxtrack(file: file, index: 0, user: Wobauth::User.first)

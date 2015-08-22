#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-

ENV['RAILS_ENV'] ||= 'development'
require File.dirname(__FILE__) + '/../config/environment.rb'

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


  track.trackpoints.each_with_index do |pt,idx|
    puts "#{sprintf('%03d', idx)}\t#{pt}"
  end
end

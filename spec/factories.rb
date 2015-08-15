FactoryGirl.define do

  sequence :newlid do |n|
    "lid_#{n}"
  end

  sequence :aname do |n|
    "aname_#{n}"
  end

  factory :track do
    name { generate(:aname) }
    date { Date.today }
    user
  end

  factory :trackpoint do
    longitude 50.9432141
    latitude  6.9586017
    time { Time.now }
    track
  end

end

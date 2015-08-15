require 'rails_helper'

RSpec.describe "trackpoints/new", type: :view do
  before(:each) do
    assign(:trackpoint, Trackpoint.new(
      :longitude => "9.99",
      :latitude => "9.99",
      :elevation{8,2} => "MyString",
      :track => nil,
      :heart_rate => 1
    ))
  end

  it "renders new trackpoint form" do
    render

    assert_select "form[action=?][method=?]", trackpoints_path, "post" do

      assert_select "input#trackpoint_longitude[name=?]", "trackpoint[longitude]"

      assert_select "input#trackpoint_latitude[name=?]", "trackpoint[latitude]"

      assert_select "input#trackpoint_elevation{8,2}[name=?]", "trackpoint[elevation{8,2}]"

      assert_select "input#trackpoint_track_id[name=?]", "trackpoint[track_id]"

      assert_select "input#trackpoint_heart_rate[name=?]", "trackpoint[heart_rate]"
    end
  end
end

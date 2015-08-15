require 'rails_helper'

RSpec.describe "trackpoints/edit", type: :view do
  before(:each) do
    @trackpoint = assign(:trackpoint, Trackpoint.create!(
      :longitude => "9.99",
      :latitude => "9.99",
      :elevation => "160.2",
      :time => Time.now,
      :heart_rate => 1
    ))
  end

  it "renders the edit trackpoint form" do
    render

    assert_select "form[action=?][method=?]", trackpoint_path(@trackpoint), "post" do

      assert_select "input#trackpoint_longitude[name=?]", "trackpoint[longitude]"

      assert_select "input#trackpoint_latitude[name=?]", "trackpoint[latitude]"

      assert_select "input#trackpoint_elevation[name=?]", "trackpoint[elevation]"

      assert_select "input#trackpoint_track_id[name=?]", "trackpoint[track_id]"

      assert_select "input#trackpoint_heart_rate[name=?]", "trackpoint[heart_rate]"
    end
  end
end

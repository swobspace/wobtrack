require 'rails_helper'

RSpec.describe "trackpoints/edit", type: :view do
  let(:user)  { FactoryGirl.build_stubbed(:user) }
  let(:ts)    { Time.now }
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "trackpoint" }
    allow(controller).to receive(:action_name) { "edit" }
    allow(controller).to receive(:current_user).and_return(user)

    @track = FactoryGirl.build_stubbed(:track)

    @trackpoint = assign(:trackpoint, Trackpoint.create!(
      :longitude => "9.99",
      :latitude => "8.88",
      :elevation => "160.2",
      :time => ts,
      :track_id => @track.id,
      :heart_rate => 1
    ))
  end

  it "renders the edit trackpoint form" do
    render

    assert_select "form[action=?][method=?]", track_trackpoint_path(@track, @trackpoint), "post" do

      assert_select "input#trackpoint_longitude[name=?]", "trackpoint[longitude]"
      assert_select "input#trackpoint_latitude[name=?]", "trackpoint[latitude]"
      assert_select "input#trackpoint_elevation[name=?]", "trackpoint[elevation]"
      assert_select "select#trackpoint_track_id[name=?]", "trackpoint[track_id]", count: 0
      assert_select "input#trackpoint_heart_rate[name=?]", "trackpoint[heart_rate]"
    end
  end
end

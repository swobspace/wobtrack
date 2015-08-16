require 'rails_helper'

RSpec.describe "trackpoints/index", type: :view do
  let(:user)  { FactoryGirl.build_stubbed(:user) }
  let(:ts)    { Time.now }
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "trackpoint" }
    allow(controller).to receive(:action_name) { "index" }
    allow(controller).to receive(:current_user).and_return(user)

    @track = FactoryGirl.build_stubbed(:track)

    assign(:trackpoints, [
      Trackpoint.create!(
        :longitude => "9.99",
        :latitude => "8.88",
        :elevation => "160.2",
        :track => @track,
 	:time => ts,
        :heart_rate => 1
      ),
      Trackpoint.create!(
        :longitude => "9.99",
        :latitude => "8.88",
        :elevation => "160.2",
        :track => @track,
 	:time => ts,
        :heart_rate => 1
      )
    ])
  end

  it "renders a list of trackpoints" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "8.88".to_s, :count => 2
    assert_select "tr>td", :text => "160.2".to_s, :count => 2
    assert_select "tr>td", :text => @track.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

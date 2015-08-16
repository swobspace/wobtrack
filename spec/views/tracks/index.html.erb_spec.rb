require 'rails_helper'

RSpec.describe "tracks/index", type: :view do
  let(:user) { FactoryGirl.build_stubbed(:user) }
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "tracks" }
    allow(controller).to receive(:action_name) { "edit" }
    allow(controller).to receive(:current_user).and_return(user)

    assign(:tracks, [
      Track.create!(
        :name => "Name",
        :description => "MyText",
        :user => user,
        :date => Date.today,
        :creator => "Creator"
      ),
      Track.create!(
        :name => "Name",
        :description => "MyText",
        :user => user,
        :date => Date.today,
        :creator => "Creator"
      )
    ])
  end

  it "renders a list of tracks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => user.to_s, :count => 2
    assert_select "tr>td", :text => Date.today.to_s, :count => 2
    assert_select "tr>td", :text => "Creator".to_s, :count => 2
  end
end

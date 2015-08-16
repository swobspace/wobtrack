require 'rails_helper'

RSpec.describe "tracks/new", type: :view do
   let(:user) { FactoryGirl.build_stubbed(:user) }

  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "tracks" }
    allow(controller).to receive(:action_name) { "new" }
    allow(controller).to receive(:current_user).and_return(user)


    assign(:track, Track.new(
      :name => "MyString",
      :description => "MyText",
      :user => user,
      :creator => "MyString"
    ))
  end

  describe "with ability to manage tracks" do
    before(:each) do
      @ability.can :manage, Track
      render
    end

    it "renders new track form" do
      assert_select "form[action=?][method=?]", tracks_path, "post" do
        assert_select "input#track_name[name=?]", "track[name]"
        assert_select "textarea#track_description[name=?]", "track[description]"
        assert_select "select#track_user_id[name=?]", "track[user_id]"
        assert_select "input#track_creator[name=?]", "track[creator]"
      end
    end
  end
end

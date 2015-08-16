require 'rails_helper'

RSpec.describe "tracks/show", type: :view do
  let(:user) { FactoryGirl.build_stubbed(:user) }
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "tracks" }
    allow(controller).to receive(:action_name) { "show" }
    allow(controller).to receive(:current_user).and_return(user)

    @track = assign(:track, Track.create!(
      :name => "Name",
      :description => "MyText",
      :user => user,
      :date => Date.today,
      :creator => "Creator"
    ))
  end

  describe "with ability to manage tracks" do
    before(:each) do
      @ability.can :read, Track
      render
    end

    it "renders attributes in <p>" do
      expect(rendered).to match(/Name/)
      expect(rendered).to match(/MyText/)
      expect(rendered).to match(/#{user}/)
      expect(rendered).to match(/#{Date.today}/)
      expect(rendered).to match(/Creator/)
    end
  end
end

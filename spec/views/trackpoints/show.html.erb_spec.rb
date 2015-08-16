require 'rails_helper'

RSpec.describe "trackpoints/show", type: :view do
  let(:user)  { FactoryGirl.build_stubbed(:user) }
  let(:ts)    { Time.now }
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "trackpoint" }
    allow(controller).to receive(:action_name) { "show" }
    allow(controller).to receive(:current_user).and_return(user)

    @track = FactoryGirl.build_stubbed(:track)

    @trackpoint = assign(:trackpoint, Trackpoint.create!(
      :longitude => "9.99",
      :latitude => "8.88",
      :elevation => "160.2",
      :track => @track,
      :time => ts,
      :heart_rate => 123
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/8.88/)
    expect(rendered).to match(/160.2/)
    expect(rendered).to match(/123/)
    pending "match does not work yet"
    expect(rendered).to match(/#{ts.to_s}/)
  end
end

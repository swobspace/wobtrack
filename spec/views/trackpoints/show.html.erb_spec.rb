require 'rails_helper'

RSpec.describe "trackpoints/show", type: :view do
  before(:each) do
    @trackpoint = assign(:trackpoint, Trackpoint.create!(
      :longitude => "9.99",
      :latitude => "9.99",
      :elevation{8,2} => "Elevation{8,2}",
      :track => nil,
      :heart_rate => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Elevation{8,2}/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end

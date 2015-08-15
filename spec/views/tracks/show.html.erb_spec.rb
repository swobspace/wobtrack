require 'rails_helper'

RSpec.describe "tracks/show", type: :view do
  before(:each) do
    @track = assign(:track, Track.create!(
      :name => "Name",
      :description => "MyText",
      :user => nil,
      :creator => "Creator"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Creator/)
  end
end

require 'rails_helper'

RSpec.describe "trackpoints/index", type: :view do
  before(:each) do
    assign(:trackpoints, [
      Trackpoint.create!(
        :longitude => "9.99",
        :latitude => "9.99",
        :elevation => "160.2",
        :track => nil,
        :heart_rate => 1
      ),
      Trackpoint.create!(
        :longitude => "9.99",
        :latitude => "9.99",
        :elevation => "160.2",
        :track => nil,
        :heart_rate => 1
      )
    ])
  end

  it "renders a list of trackpoints" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "160.2".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

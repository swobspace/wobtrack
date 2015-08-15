require 'rails_helper'

RSpec.describe "tracks/new", type: :view do
  before(:each) do
    assign(:track, Track.new(
      :name => "MyString",
      :description => "MyText",
      :wobauth_user => nil,
      :creator => "MyString"
    ))
  end

  it "renders new track form" do
    render

    assert_select "form[action=?][method=?]", tracks_path, "post" do

      assert_select "input#track_name[name=?]", "track[name]"

      assert_select "textarea#track_description[name=?]", "track[description]"

      assert_select "input#track_wobauth_user_id[name=?]", "track[wobauth_user_id]"

      assert_select "input#track_creator[name=?]", "track[creator]"
    end
  end
end

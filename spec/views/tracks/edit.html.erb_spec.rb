require 'rails_helper'

RSpec.describe "tracks/edit", type: :view do
  before(:each) do
    @track = assign(:track, Track.create!(
      :name => "MyString",
      :description => "MyText",
      :user => nil,
      :creator => "MyString"
    ))
  end

  it "renders the edit track form" do
    render

    assert_select "form[action=?][method=?]", track_path(@track), "post" do

      assert_select "input#track_name[name=?]", "track[name]"

      assert_select "textarea#track_description[name=?]", "track[description]"

      assert_select "input#track_user_id[name=?]", "track[user_id]"

      assert_select "input#track_creator[name=?]", "track[creator]"
    end
  end
end

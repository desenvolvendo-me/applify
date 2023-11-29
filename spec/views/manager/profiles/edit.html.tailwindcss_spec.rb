require 'rails_helper'

RSpec.describe "manager/profiles/edit", type: :view do
  before(:each) do
    @manager_profile = assign(:manager_profile, Manager::Profile.create!(
      user: nil,
      name: "MyString",
      user_type: 1
    ))
  end

  it "renders the edit manager_profile form" do
    render

    assert_select "form[action=?][method=?]", manager_profile_path(@manager_profile), "post" do

      assert_select "input[name=?]", "manager_profile[user_id]"

      assert_select "input[name=?]", "manager_profile[name]"

      assert_select "input[name=?]", "manager_profile[user_type]"
    end
  end
end

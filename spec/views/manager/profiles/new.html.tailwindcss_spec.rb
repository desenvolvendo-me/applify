require 'rails_helper'

RSpec.describe "manager/profiles/new", type: :view do
  before(:each) do
    assign(:manager_profile, Manager::Profile.new(
      user: nil,
      name: "MyString",
      user_type: 1
    ))
  end

  it "renders new manager_profile form" do
    render

    assert_select "form[action=?][method=?]", manager_profiles_path, "post" do

      assert_select "input[name=?]", "manager_profile[user_id]"

      assert_select "input[name=?]", "manager_profile[name]"

      assert_select "input[name=?]", "manager_profile[user_type]"
    end
  end
end

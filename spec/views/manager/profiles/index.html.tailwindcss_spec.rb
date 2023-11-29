require 'rails_helper'

RSpec.describe "manager/profiles/index", type: :view do
  before(:each) do
    assign(:manager_profiles, [
      Manager::Profile.create!(
        user: nil,
        name: "Name",
        user_type: 2
      ),
      Manager::Profile.create!(
        user: nil,
        name: "Name",
        user_type: 2
      )
    ])
  end

  it "renders a list of manager/profiles" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end

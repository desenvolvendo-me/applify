require 'rails_helper'

RSpec.describe "manager/profiles/show", type: :view do
  before(:each) do
    @manager_profile = assign(:manager_profile, Manager::Profile.create!(
      user: nil,
      name: "Name",
      user_type: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end

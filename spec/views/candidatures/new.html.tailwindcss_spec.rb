require 'rails_helper'

RSpec.describe "candidatures/new", type: :view do
  before(:each) do
    assign(:candidature, Candidature.new(
      company_name: "MyString",
      situation: "MyString"
    ))
  end

  it "renders new candidature form" do
    render

    assert_select "form[action=?][method=?]", candidatures_path, "post" do

      assert_select "input[name=?]", "candidature[company_name]"

      assert_select "input[name=?]", "candidature[situation]"
    end
  end
end

require 'rails_helper'

RSpec.describe "candidatures/edit", type: :view do
  before(:each) do
    @candidature = assign(:candidature, Candidature.create!(
      company_name: "MyString",
      situation: "MyString"
    ))
  end

  it "renders the edit candidature form" do
    render

    assert_select "form[action=?][method=?]", candidature_path(@candidature), "post" do

      assert_select "input[name=?]", "candidature[company_name]"

      assert_select "input[name=?]", "candidature[situation]"
    end
  end
end

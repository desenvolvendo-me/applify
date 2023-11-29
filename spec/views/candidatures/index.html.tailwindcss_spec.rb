require 'rails_helper'

RSpec.describe "candidatures/index", type: :view do
  before(:each) do
    assign(:candidatures, [
      Candidature.create!(
        company_name: "Company Name",
        situation: "Situation"
      ),
      Candidature.create!(
        company_name: "Company Name",
        situation: "Situation"
      )
    ])
  end

  it "renders a list of candidatures" do
    render
    assert_select "tr>td", text: "Company Name".to_s, count: 2
    assert_select "tr>td", text: "Situation".to_s, count: 2
  end
end

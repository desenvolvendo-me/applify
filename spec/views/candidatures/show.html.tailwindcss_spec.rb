require 'rails_helper'

RSpec.describe 'candidatures/show', type: :view do
  before(:each) do
    @candidature = assign(:candidature, Candidature.create!(
                                          company_name: 'Company Name',
                                          situation: 'Situation'
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Situation/)
  end
end

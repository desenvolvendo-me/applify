require 'rails_helper'

RSpec.describe 'candidatures/index', type: :view do
  it 'renders the index page' do
    assign(:candidatures,
           [FactoryBot.create(:candidature), FactoryBot.create(:candidature)])

    render

    expect(rendered).to have_selector('h1', text: 'Candidatures')

    expect(rendered).to have_link('Add candidature', href: new_candidature_path)

    expect(rendered).to have_selector('div#candidatures') do
      expect(rendered).to render_template(partial: '_candidature', count: 2)
    end
  end
end

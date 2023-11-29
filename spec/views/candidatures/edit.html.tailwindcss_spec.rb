require 'rails_helper'

RSpec.describe 'candidatures/edit', type: :view do
  it 'renders the edit page' do
    candidature = FactoryBot.create(:candidature)
    assign(:candidature, candidature)

    render

    expect(rendered).to have_selector('h1', text: 'Editing candidature')
    expect(rendered).to render_template(partial: '_form')
    expect(rendered).to have_link('Show this candidature', href: candidature_path(candidature))
    expect(rendered).to have_link('Back to candidatures', href: candidatures_path)
  end
end

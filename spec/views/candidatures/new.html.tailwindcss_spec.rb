# spec/views/candidatures/new.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'candidatures/new', type: :view do
  it 'renders the new page' do
    assign(:candidature, FactoryBot.build(:candidature))

    render

    expect(rendered).to have_selector('h1', text: 'New candidature')
    expect(rendered).to render_template(partial: '_form')
    expect(rendered).to have_link('Back to candidatures',
                                  href: candidatures_path)
  end
end

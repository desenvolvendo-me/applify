require 'rails_helper'

RSpec.feature 'Manager Stack', type: :feature do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    login_as(user)
  end

  before do
    create(:stack, name: 'Ruby')
    create(:stack, name: 'Ruby on Rails')
  end

  scenario 'list stack' do
    visit manager_stacks_path

    expect(page).to have_text('Ruby')
    expect(page).to have_text('Ruby on Rails')
  end

  scenario 'show stack' do
    visit manager_stack_path(Stack.first)

    expect(page).to have_text('Ruby')
  end

  scenario 'update stack' do
    visit manager_stack_path(Stack.last)
    click_link 'Editar'

    fill_in 'Nome', with: 'Ruby on Rails'
    click_button I18n.t('views.manager.stack.salve')

    expect(page).to have_text('Stack atualizada com sucesso.')
    expect(page).to have_text('Ruby on Rails')
  end

  scenario 'delete stack' do
    visit manager_stack_path(Stack.first)
    click_link 'Apagar'

    page.accept_alert I18n.t('views.manager.stack.delete_confirm')
    expect(page).to have_text('Stack apagada com sucesso.')
  end
end

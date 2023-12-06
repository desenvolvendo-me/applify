require 'rails_helper'

RSpec.feature 'Manager Stack', type: :feature do
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
    click_link 'Edit this manager_stack'

    fill_in 'Name', with: 'Ruby'
    click_button 'Atualizar Stack'

    expect(page).to have_text('Stack successfully updated')
    expect(page).to have_text('Ruby')
  end

  scenario 'delete stack' do
    visit manager_stack_path(Stack.first)
    click_button 'Destroy this manager_stack'

    expect(page).to have_text('Stack successfully destroy.')
  end
end
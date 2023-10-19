require 'rails_helper'

RSpec.feature 'Food#index Page', type: :feature do
  scenario 'unauthorized user cannot add a new food' do
    user = create(:user)
    login_as(user, scope: :user)
    visit food_index_path
    expect(page).not_to have_button('Add food', exact: true)
  end

  scenario 'unauthorized user cannot delete food' do
    user = create(:user)
    login_as(user, scope: :user)
    visit food_index_path
    expect(page).not_to have_button('delete', exact: true)
  end

  scenario 'authorized user can add a new food' do
    user = create(:user)
    login_as(user, scope: :user)
    visit food_index_path
    expect(page).to have_link('Add food', href: new_food_path, class: 'btn btn-primary mb-3 float-end')
  end

  scenario 'authorized user can delete their food' do
    user = create(:user)
    login_as(user, scope: :user)
    visit food_index_path
    expect(page).not_to have_button('Delete', exact: true)
  end

  scenario 'No Foods Message: Check if a message is displayed when there are no foods available' do
    user = create(:user)
    login_as(user, scope: :user)
    visit food_index_path
    expect(page).to have_content('No foods available.')
  end
end

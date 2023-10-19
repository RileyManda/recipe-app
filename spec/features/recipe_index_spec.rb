require 'rails_helper'

RSpec.feature 'Recipe#index Page', type: :feature do
  scenario 'authorized user can add a new recipe' do
    user = create(:user)
    login_as(user, scope: :user)
    visit recipe_index_path
    click_button('Add Recipe')
    expect(page).to have_current_path(new_recipe_path)
  end

  scenario 'user can remove their recipe' do
    user = create(:user)
    login_as(user, scope: :user)
    visit recipe_index_path
    expect(page).not_to have_button('Remove', exact: true)
  end

  scenario 'user can add a new recipe' do
    user = create(:user)
    login_as(user, scope: :user)
    visit recipe_index_path
    expect(page).to have_button('Add Recipe', exact: true)
  end
end

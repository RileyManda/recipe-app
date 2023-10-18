require 'rails_helper'

RSpec.feature 'Recipe#index Page', type: :feature do
  scenario 'authorized user can add a new recipe' do
    user = create(:user)
    login_as(user, scope: :user)
    visit recipe_index_path
    click_button('Add Recipe')

    expect(page).to have_current_path(new_recipe_path)
  end
  #   scenario 'user can see the list of recipes' do
  #     user = create(:user)
  #     recipe = create(name: 'Vegetable Soup', description: 'A delicious chicken curry', user: user)
  #     visit recipe_index_path
  #     expect(page).to have_content('Recipes')
  #     expect(page).to have_content('Vegetable Soup')
  #     expect(page).to have_content('A delicious chicken curry')
  #     expect(page).to have_button('Remove')
  #   end

  #   scenario 'user sees a message when there are no recipes available' do
  #     visit recipe_index_path

  #     expect(page).to have_content('Recipes')
  #     expect(page).to have_content('No recipes available.')
  #     expect(page).not_to have_button('Remove')
  #   end
end

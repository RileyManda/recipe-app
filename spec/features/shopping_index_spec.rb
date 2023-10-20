require 'rails_helper'
RSpec.feature 'Shopping List Page', type: :feature do
  scenario 'user can view shopping list information' do
    user = create(:user)
    login_as(user, scope: :user)
    # Create valid Recipe and Food records
    recipe = create(:recipe)
    food = create(:food)
    # Create recipe foods using the recipe_food factory with valid associations
    recipe_foods = [
      create(:recipe_food, recipe: recipe, food: food, quantity: 100, value: 10),
      create(:recipe_food, recipe: recipe, food: food, quantity: 200, value: 20),
    ]
    visit shopping_index_path
    expect(page).to have_content('Shopping List')
    expect(page).to have_content("Amount of food to buy: #{recipe_foods.size}")
    expect(page).to have_content("Total value of food needed: $#{recipe_foods.sum { |rf| rf.quantity * rf.value }}")
    recipe_foods.each do |recipe_food|
      expect(page).to have_content(recipe_food.food.name)
      expect(page).to have_content("#{recipe_food.quantity}g")
      expect(page).to have_content("$#{recipe_food.quantity * recipe_food.value}")
    end
  end
  scenario 'user sees a message when there are no shopping items' do
    user = create(:user)
    login_as(user, scope: :user)
    visit shopping_index_path
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('No shopping list available.')
  end
end
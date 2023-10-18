require 'rails_helper'

RSpec.describe 'Recipes Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Riley', email: 'riley@email.com', password: 'riley123', confirmed_at: Time.now)

    sign_in @user

    @recipes = [
      Recipe.create(
        user: @user,
        name: 'Apple Pie',
        description: 'Made with love and apples',
        public: true
      ),
      Recipe.create(
        user: @user,
        name: 'Apple Pie',
        description: 'Warm and creamy',
        public: false
      )
    ]

    visit recipe_path
  end

  describe 'GET /recipe' do
    it 'can see all the recipes added' do
      expect(page).to have_content('Apple Pie')

    end

  #   it "can see each recipe's name." do
  #     @recipes.each do |recipe|
  #       expect(page).to have_content(recipe.name)
  #     end
  #   end

  #   it "can see each recipe's description." do
  #     @recipes.each do |recipe|
  #       expect(page).to have_content(recipe.description)
  #     end
  #   end

  #   it 'can see a button to remove each recipe' do
  #     @recipes.each do
  #       expect(page).to have_button('Remove')
  #     end
  #   end
  # end

  # describe 'GET recipe/id' do
  #   it "redirects to the recipe's individual page when clicking on the recipe's name" do
  #     recipe = @recipes.first
  #     click_link(recipe.name)
  #     expect(page).to have_current_path(recipe_path(recipe))
  #   end
  # end
end
end

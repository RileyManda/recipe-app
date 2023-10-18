require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe Recipe, type: :model do
    it 'is valid with valid attributes' do
      user = User.create(name: 'johndoes', email: 'john@email.com', password: '123456')
      recipe = Recipe.new(
        name: 'Sample Recipe',
        preparation_time: 30,
        cooking_time: 60,
        description: 'Recipe description',
        public: true,
        user:
      )
      expect(recipe).to be_valid
    end

    it 'is not valid without a name' do
      recipe = Recipe.new(name: nil)
      expect(recipe).not_to be_valid
    end

    it 'is not valid without a user' do
      recipe = Recipe.new(
        name: 'MyRecipe',
        preparation_time: 30,
        cooking_time: 60,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        public: true
      )
      expect(recipe).not_to be_valid
    end
  end
end

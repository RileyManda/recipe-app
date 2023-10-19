FactoryBot.define do
  factory :recipe_food do
    quantity { 500 }
  end
end

FactoryBot.define do
  factory :user do
    name { 'Riley' }
    email { 'riley@example.com' }
    password { 'password123' }
  end
end

FactoryBot.define do
  factory :food do
    name { 'Broccoli' }
    measurement_unit { 'grams' }
    price { 500 }
    quantity { 10 }
    user
  end
end

FactoryBot.define do
  factory :recipe do
    name { 'Vegetable Soup' }
    preparation_time { 10 }
    cooking_time { 20 }
    description { 'A delicious vegetable soup' }
    public { true }
    user
  end
end

FactoryBot.define do
  factory :public_recipe, class: 'Recipe' do
    name { 'Public Recipe' }
    preparation_time { 15 }
    cooking_time { 25 }
    description { 'A public recipe' }
    public { true }
    user
  end
end

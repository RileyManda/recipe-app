FactoryBot.define do
  factory :food do
    name { 'Brocolli' }
    measurement_unit { 'g' }
    price { 0.7 }
    quantity { 1000 }
    user
  end
end

FactoryBot.define do
  factory :user do
    name { 'Riley' }
    email { 'riley@example.com' }
    password { 'password123' }
    food
  end
end

FactoryBot.define do
  factory :recipe do
    name { 'Vegetable Soup' }
    preparation_time { 10 }
    cooking_time { 20 }
    description { 'A delicious chicken curry' }
    public { true }
    user
  end
end

FactoryBot.define do
  factory :recipe_food do
    quantity { 500 }
    recipe
    food
  end
end

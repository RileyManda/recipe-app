require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:food) { Food.new(name: 'Apple', measurement_unit: 'lb') }

  it 'validates the presence of the name' do
    food.name = nil
    expect(food).to_not be_valid
  end

  it 'validates the presence of the measurement unit' do
    food.measurement_unit = nil
    expect(food).to_not be_valid
  end

  it 'combines the name and measurement unit' do
    expect(food.name_with_measurement_unit).to eq 'Apple (lb)'
  end

  it 'validates the minimum name length of 2 characters' do
    food.name = 'Y'
    expect(food).to_not be_valid
  end

  it 'validates the maximum name length of 50 characters' do
    food.name = 'a' * 51
    expect(food).to_not be_valid
  end

  it 'validates the presence of a price' do
    food.price = nil
    expect(food).to_not be_valid
  end

  it 'validates a non-negative price' do
    food.price = -1
    expect(food).to_not be_valid
  end

  it 'validates the presence of a quantity' do
    food.quantity = nil
    expect(food).to_not be_valid
  end

  it 'validates a non-negative quantity' do
    food.quantity = -1
    expect(food).to_not be_valid
  end
end

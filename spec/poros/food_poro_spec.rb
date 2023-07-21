require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'attributes' do
    it 'has attributes' do
      data = {
        gtinUpc: '070560951975',
        description: 'SWEET POTATOES',
        brandOwner: 'Veggie Co',
        ingredients: 'SWEET POTATOES.'
      }

      food = Food.new(data)

      expect(food.gtin_upc).to eq('070560951975')
      expect(food.description).to eq('SWEET POTATOES')
      expect(food.brand_owner).to eq('Veggie Co')
      expect(food.ingredients).to eq('SWEET POTATOES.')
    end
  end
end
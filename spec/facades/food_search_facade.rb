require 'rails_helper'

RSpec.describe FoodSearchFacade do
  describe 'search' do
    it 'returns a hash with total results and an array of Food objects' do
      query = 'sweet potatoes'

      results = FoodSearchFacade.search(query)

      expect(results[:total_results]).to eq(55579)
      expect(results[:foods].length).to eq(10)
      expect(results[:foods]).to all(be_a(Food))

      first_food = results[:foods].first
      expect(first_food.gtin_upc).to eq("8901020020844")
      expect(first_food.description).to eq("SWEET POTATOES")
      expect(first_food.brand_owner).to eq("NOT A BRANDED ITEM")
      expect(first_food.ingredients).to eq("ORGANIC SWEET POTATOES.")
    end
  end
end
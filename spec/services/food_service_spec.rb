require 'rails_helper'

RSpec.describe FoodService do
  describe 'class methods' do
    it 'can create a connection and consume api' do
      foods = FoodService.food_search('sweet potatoes')

      expect(foods).to be_a(Hash)
      expect(foods)


    end
  end
end
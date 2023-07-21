class FoodSearchFacade
  def self.search(query)
    response = FoodService.food_search(query)
    {
      total_results: response[:totalHits],
      foods: response[:foods][0..9].map { |food_data| Food.new(food_data) }
    }
  end
end
class FoodService
  def self.food_search(food)
    
  end

  def self.conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |f|
      f.params['api_key'] = ENV['FOOD_API_KEY']
    end
  end
end
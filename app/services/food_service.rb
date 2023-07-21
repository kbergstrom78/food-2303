class FoodService
  def self.conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |f|
      f.params['api_key'] = ENV['FOOD_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def self.food_search(food)
    response = conn.get('fdc/v1/foods/search') do |req|
      req.params['query'] = food
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end

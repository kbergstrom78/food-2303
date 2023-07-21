class FoodsController < ApplicationController
  def index
    results = FoodSearchFacade.search(params[:query])
    @total_results = results[:total_results]
    @foods = results[:foods]
  end
end
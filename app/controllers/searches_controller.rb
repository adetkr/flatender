class SearchesController < ApplicationController
    def index
      @searches = Search.where(user_id: current_user.id)
    end

    def create
      @search = Search.new(params_search)
      @search.user = current_user
      @search.save!
    end

    private 

    def params_search
      params.require(:search).permit(:city, :min_price, :max_price, :min_surface, :max_surface, :min_rooms, :max_rooms)
    end
end

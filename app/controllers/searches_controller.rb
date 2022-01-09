class SearchesController < ApplicationController
    def index
      @searches = Search.where(user_id: current_user.id)
      @matchs = []
      @match = nil
      current_user.flats.each do |flat|
        flatmatchs = FlatMatch.where(flat_id: flat.id)
        flatmatchs.each do |flatmatch|
          @matchs << Match.find(flatmatch.match.id)
        end
      end
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

class SearchesController < ApplicationController
    def index
      @searches = Search.all
    end

    def create
      @search = Search.new(params_search)
      @search.save!
    end

    private 

    def params_search
      params.require(:search).permit(:name)
    end
end

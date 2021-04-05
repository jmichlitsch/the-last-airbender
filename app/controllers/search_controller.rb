class SearchController < ApplicationController
    def index
        @members = SearchFacade.get_info(params[:nation])
        @population = SearchFacade.get_pop(params[:nation])
    end
end

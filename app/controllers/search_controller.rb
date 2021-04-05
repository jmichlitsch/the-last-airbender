class SearchController < ApplicationController
    def index
        @members = SearchFacade.get_info(params[:nation])
    end
end

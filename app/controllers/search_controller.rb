class SearchController < ApplicationController
    def index
        @members = TheLastAirbenderFacade.get_info(params[:nation])
    end



    # def parse(json)
    #     JSON.parse(json.body, symbolize_names: true)
    # end
end

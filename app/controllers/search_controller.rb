class SearchController < ApplicationController
    def index 
        @info = find_members(params[:nation])
    end

    def find_members(nation)
        response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=#{nation.gsub('_', '+')}&perPage=10000")
        body = JSON.parse(response.body, symbolize_names: true)
    end

    def conn 
        @conn = Faraday.new(url: "https://last-airbender-api.herokuapp.com/api/v1")
    end

    # def parse(json)
    #     JSON.parse(json.body, symbolize_names: true)
    # end
end 
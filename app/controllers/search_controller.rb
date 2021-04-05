class SearchController < ApplicationController
    def index 
        @info = find_members(params[:nation])
    end

    def find_members(nation)
        response = conn.get("characters?affiliation=#{nation}&perPage=10000")
        results = parse(response)

        {population: results.count,
        characters: results[0..24]}
        binding.pry
    end

    def conn 
        @conn = Faraday.new(url: "https://last-airbender-api.herokuapp.com/api/v1")
    end

    def parse(json)
        JSON.parse(json.body, symbolize_names: true)
    end
end 
class SearchFacade
  def self.get_info(nation_name,character_number=25)
    response = SearchService.get_nation_info(nation_name,character_number)
    body = response[:characters]

    body.first(25).map do |new_member|
      Member.new(new_member)
    end
  end

  def self.get_pop(nation_name,character_number=25)
    response = SearchService.get_nation_info(nation_name,character_number)
    body = response[:population]
  end
end











# def self.get_nation_info(nation_name,number_of_characters)
#     response = conn.get("characters?affiliation=#{nation_name}&perPage=10000")
#     results = json_parse(response)
#     {
#       population: results.count,
#       characters: results[0..(number_of_characters-1)]
#     }
#   end
#
#   private
#
#   def self.conn
#     @@conn = Faraday.new(url: "https://last-airbender-api.herokuapp.com/api/v1")
#   end
#
#   def self.json_parse(json)
#     JSON.parse(json.body, symbolize_names: true)

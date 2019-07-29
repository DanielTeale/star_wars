class SwapiService
  include HTTParty
  base_uri'https://swapi.co/api/'

  @error = "Something went wrong"

  def self.perform(type, id = nil)
    begin
      url = id ? "/#{type}/#{id}" : "/#{type}"
      get(url).to_json
    rescue HTTParty::Error
      puts HTTParty:Error
    rescue StandardError
      @error
    end
  end
end
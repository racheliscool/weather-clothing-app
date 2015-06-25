require 'open-uri'
require 'json'

# GET http://api.wunderground.com/api/4966e73960475833/features/settings/q/query.format
class Weather
  attr_reader :state, :city, :temp_f, :description
  def initialize(state, city)
    @state = state
    @city = city.gsub(" ", "%20")
  end
  
  def get_weather_conditions
    
    url = "http://api.wunderground.com/api/4966e73960475833/forecast/geolookup/conditions/q/NY/New%20York.json"
    
    #url = "http://api.wunderground.com/api/4966e73960475833/forecast/geolookup/conditions/q/#{state}/#{city}.json"
    opened_page = open(url)
    @forcast_data = JSON.load(opened_page)
    puts @forcast_data.inspect
  end
  
  def where_are_you
    # code here    
  end
  
  def fetch_temperature
    @temp_f=@forcast_data["current_observation"]["temp_f"]
  end
  
  def fetch_description
    @description=@forcast_data["forecast"]["txt_forecast"]["forecastday"][0]["icon"]
  end
  
  
end

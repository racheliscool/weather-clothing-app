require 'open-uri'
require 'json'

GET http://api.wunderground.com/api/4966e73960475833/features/settings/q/query.format
class Weather
  attr_readers :state, :city
  def initialize(state, city)
    @state = state
    @city = city
  end
  
  def get_weather_conditions
    
    url = "http://api.wunderground.com/api/4966e73960475833/forecast/geolookup/conditions/q/#{state}/#{city}.json"
    opened_page = open(url)
    JSON.load(opened_page)
    
  end
  
  def where_are_you
    
    
  end
  
  
end


  
 
  
  
  
  
  
end
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
    
    url = "http://api.wunderground.com/api/4966e73960475833/forecast/geolookup/conditions/q/#{state}/#{city}.json"
    
    #url = "http://api.wunderground.com/api/4966e73960475833/forecast/geolookup/conditions/q/#{state}/#{city}.json"
    opened_page = open(url)
    @forcast_data = JSON.load(opened_page)
    puts @forcast_data.inspect
  end
  
    def fetch_temperature
    @temp_f=@forcast_data["current_observation"]["temp_f"]
    end
  
  def fetch_description
    @description=@forcast_data["forecast"]["txt_forecast"]["forecastday"][0]["icon"]
  end
  
  def what_to_bring
    if @city_state_description.include?("rain") || @city_state_description.include?("tstorm")
      puts "You should bring an umbrella and rainboots."
    elsif @city_state_description.include?("snow") || @city_state_description.include?("slush")
      puts "You should wear snowboots."
    end
  end
  
#   class WhatToWear
#     attr_reader :temp
#     def initialize(temp)
#       @tops = "don't know"
#       @bottoms = "don't know"
#       @outerwear = []
#       @accessories = []
#       @temp = temp
#     end
    
  def decide(temp)
      if temp<32 && temp>=0
        return "long sleeves, long pants, and a winter coat with a heavy sweat or fleece. Don't forget your hat, gloves, and scarf!"
      elsif temp<45 && temp>=32
        return "long sleeves, long pants, and a winter coat. Don't forget your hat, gloves, and scarf!"
      elsif temp<52 && temp>=45
        return "short sleeves or long sleeves, long pants, and a jacket with a sweater or a sweater with a vest. Don't forget your scarf!"
      elsif temp<60 && temp>=52
        return "short sleeves or long sleeves, long pants, and a light jacket. You might want to bring a scarf, too!"
      elsif temp<70 && temp>=60
        return "short sleeves or long sleeves, shorts, a skirt, or pants, and a sweater."
      elsif temp<80 && temp>=70
        return "a tshirt with shorts or a skirt, or a light dress."
      elsif temp<100 && temp>=80
        return "a short-sleeved shirt or tank top with shorts or a skirt, or a light summer dress."
      end
    end  
   def what_to_bring(description)
     if description.include?("rain") == true || description.include?("chancerain") == true || description.include?("sleet") == true
       return "You should bring an umbrella and rainboots."
     elsif description.include?("snow") == true || description.include?("chancesnow") == true || description.include?("sleet") == true
       return "You should wear snowboots."
      else 
       return "Your personal flair!"
      end
    end
 end  
  

  

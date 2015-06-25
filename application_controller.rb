require 'bundler'
Bundler.require
require_relative "models/weather.rb"

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/weather' do 
    # {"city" => "New York", "state" => "NY}
    city = params["city"]
    state = params["state"]
    
    city_state = Weather.new(state, city)
    @city_state_for_weather = city_state.get_weather_conditions
    erb :results
  end


end
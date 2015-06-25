require 'bundler'
Bundler.require
require_relative "models/weather.rb"
require 'pry'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/weather' do 
    # {"city" => "New York", "state" => "NY}
    city = params["city"]
    state = params["state"]
    
    city_state = Weather.new(state, city)
    @city_state_for_weather=city_state.get_weather_conditions
    @city_state_temperature=city_state.fetch_temperature
    @city_state_description=city_state.fetch_description
    @wear_this = city_state.decide(@city_state_temperature)
    @bring_this = city_state.what_to_bring(@city_state_description)
   
    
    @city = city
    @state = state

    erb :results
  end


end
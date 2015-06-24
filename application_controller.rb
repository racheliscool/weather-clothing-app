require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/weather' do 
    @city_state = params["user_input"]
    
    city_state = Weather.new(city_state)
    @city_state_for_weather = city_state.get_weather_conditions
    erb :results
  end


end
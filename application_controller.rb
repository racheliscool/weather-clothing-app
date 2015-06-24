require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/weather' do 
    @zip_code = params["user_input"]
    
    zip_code = Weather.new(zip_code)
    @zip_code_for_weather = zip_code.zip_code
    erb :results
  end
 

end
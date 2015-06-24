require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/weather' do 
    @zip_code = params["user_input"]
    
    zip_code = Weather.new(zip_code)
    @translated_string = translator.translate
    erb :results
  end
  
  get "/songs" do
    @song = ["uptown funk", "let it go", "stay close"]
    erb :songs
  end

end
require 'open-uri'

GET http://api.wunderground.com/api/4966e73960475833/features/settings/q/query.format

class Weather
  attr_accessor :zip_code
  def initialize(zip_code)
    @zip_code = zip_code
  end
  
  
  


end
  
 
  
  
  
  
  
end
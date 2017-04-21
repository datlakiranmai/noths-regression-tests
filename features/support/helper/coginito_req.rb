require 'Httparty'

class Request

  def get_status
    HTTParty.get("https://cognito-idp.eu-west-1.amazonaws.com/")
  end

  def message
    JSON.parse(get_status).each{ |e,v| raise v.upcase if e == "message" }
  end

  def response
    puts get_status.response.body
  end
end
And(/^I request the status of cognito server$/) do
  @cognito = Request.new
  response=@cognito.get_status.code
  case response
    when 200
      return
    when 505
      puts "Issues with QA Environmet.....BAD gateway"
    else
      @cognito.response
  end
end

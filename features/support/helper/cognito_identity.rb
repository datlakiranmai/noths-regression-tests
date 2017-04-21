=begin
class CognitoIdentity
  include Aws::CognitoIdentity

  def create_connection
    cognitoidentity = Aws::CognitoIdentity::Client.new(region: 'us-east-1')
    puts cognitoidentity.operation_names
  end

end


ci = CognitoIdentity.new
ci.create_connection=end
=end

require 'mysql2'
require 'httparty'

module CognitoUserTable

  def connect_to_noths_db
    Mysql2::Client.new(
      :host => hostname,
      :port => '3306', :database => 'noths_qa',
      :username => 'master',
      :password => 'YYHFCJjEvYb622Dd9Pwy')
  end


  def get_credentials

  end

  def hostname
    "shared-notonthehighstreet.co2clknseqbw.eu-west-1.rds.amazonaws.com"
  end

  def username
    get_credentails.select {|e| e['key'] == 'exchange-rate/mysql/user'}.first['value']
  end

  def password
    get_credentails.select {|e| e['key'] == 'exchange-rate/mysql/password'}.first['value']
  end

  def delete_cognito_user(id)
    connect_to_noths_db.query("DELETE from cognito_accounts where user_id = #{id}")
  end


  class Cognito
    include CognitoUserTable

  end
end

er = CognitoUserTable::Cognito.new
er.delete_cognito_user(45)

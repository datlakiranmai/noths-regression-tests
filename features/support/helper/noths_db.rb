require 'mysql2'
require 'httparty'


class CognitoUserTable
  class << self
    def connect_to_noths_db
      Mysql2::Client.new(
        :host => hostname,
        :port => '3306', :database => 'noths_qa',
        :username => 'master',
        :password => 'YYHFCJjEvYb622Dd9Pwy')
    end

    def hostname
      "shared-notonthehighstreet.co2clknseqbw.eu-west-1.rds.amazonaws.com"
    end


    def user_id(user_name)
      connect_to_noths_db.query("select id from users where email =#{user_name}")
    end

    def delete_user(id)
      connect_to_noths_db.query("DELETE from cognito_accounts where user_id = #{id}")
    end

    def user_exists?(user_name)
      return true if query_user(user_name)
    end
  end
end


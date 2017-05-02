require 'mysql2'
require 'httparty'
require 'yaml'

class CognitoUserTable
  class << self
    def connect_to_noths_db
      Mysql2::Client.new(
        :host => hostname,
        :port => '3306', :database => database,
        :username => username,
        :password => password)
    end

    def config
      YAML.load_file("./config/database.yaml")
    end

    def database
      config['database']
    end

    def consul_api_hostname
      HTTParty.get("http://consul-ui.service.#{ENV['ENV_ID']}.qa.noths.com/v1/catalog/service/mysql-notonthehighstreet").response.body
    end

    def hostname
      JSON.parse(consul_api_hostname).select { |key| return key['Address'] }
    end

    def username
      HTTParty.get("http://consul-ui.service.#{ENV['ENV_ID']}.qa.noths.com/v1/kv/notonthehighstreet/mysql/user?raw")
    end

    def password
      HTTParty.get("http://consul-ui.service.#{ENV['ENV_ID']}.qa.noths.com/v1/kv/notonthehighstreet/mysql/password?raw")
    end


    def user_id(user_name)
      results=connect_to_noths_db.query("SELECT id FROM users WHERE email = '#{user_name}'") if user_exists_in_user_table?(user_name)
      results.each { |i| return i['id'] }
    end

    def delete_user(id)
      connect_to_noths_db.query("DELETE from cognito_accounts where user_id = #{id}")
    end

    def queryuser_in_cognitoAccounts_table?(user_id)
      connect_to_noths_db.query("SELECT * FROM cognito_accounts WHERE user_id=#{user_id}")
    end

    def queryuser_in_user_table(email_address)
      connect_to_noths_db.query("SELECT * FROM users WHERE email='#{email_address}'")
    end

    def user_exists_in_user_table?(user_name)
      return true if queryuser_in_user_table(user_name).count == 1
    end

    def user_exists_in_cognitoAccounts_table?(user_id)
      return true if queryuser_in_cognitoAccounts_table?(user_id).count == 1
    end
  end
end




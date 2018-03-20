require 'yaml'

class Configuration
  include Singleton

  USER_ACCOUNTS_FILE_PATH = File.expand_path('config/user_accounts.yml')

  attr_reader :browser_opt, :env_id, :driver, :sauce_username, :sauce_access_key

  def initialize
    @user_accounts = YAML.load(ERB.new(File.read(USER_ACCOUNTS_FILE_PATH)).result)
    @driver = (ENV['DRIVER'] || 'chrome').to_sym
    #@browser_opt = ENV['BROWSER_OPT'] || 'CHROME_64'
    @env_id = ENV['ENV_ID'] || 'dev'
    @sauce_username = ENV['SAUCE_USERNAME']
    @sauce_access_key = ENV['SAUCE_ACCESS_KEY']
  end

  def username(role)
    @user_accounts[role]["username"]
  end

  def password(role)
    @user_accounts[role]["password"]
  end
end
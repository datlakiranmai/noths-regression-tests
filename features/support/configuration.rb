require 'yaml'

module Configuration

  CONFIG = File.open(File.expand_path('config/user_accounts.yml'))

  def get_admin_credentials
    YAML::load_documents(CONFIG) { |d| @@config = d['admin']}
  end

  def admin_username
    @@config["username"]
  end

  def admin_password
    @@config["password"]
  end
end
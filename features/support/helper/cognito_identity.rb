require 'aws-sdk'

class CognitoIdentityProviderPool
  include Aws::CognitoIdentity

  class << self

    def create_connection
      Aws::CognitoIdentityProvider::Client.new(
        region: region,
        credentials: Aws::Credentials.new(access_key_id, secret_key_id))
    end

    def access_key_id
      ENV['AWS_ACCESS_KEY_ID']
    end

    def secret_key_id
      ENV['AWS_SECRET_ACCESS_KEY']
    end

    def region
      ENV['AWS_REGION']
    end

    def user_pool_id
      HTTParty.get("http://consul-ui.service.#{ENV['ENV_ID']}.qa.noths.com/v1/kv/notonthehighstreet/Settings/cognito/UserPoolId?raw")
    end

    def delete_identity(identity)
      create_connection.admin_delete_user({
                                            user_pool_id: user_pool_id.to_s,
                                            username: identity,
                                          })
    end

    def identity_exists?(identity)
      create_connection.admin_get_user({
                                         user_pool_id: user_pool_id.to_s,
                                         username: identity,
                                       })

    end
  end
end

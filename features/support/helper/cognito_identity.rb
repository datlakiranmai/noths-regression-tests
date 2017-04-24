require 'aws-sdk'

class CognitoIdentityProviderPool
  include Aws::CognitoIdentity

  class << self

    def create_connection
      Aws::CognitoIdentityProvider::Client.new(
        region: 'eu-west-1',
        credentials: Aws::Credentials.new('AKIAJA5LFVMUPPELXOKA', 'F8B+v+0OMoANDGd/JAVxkEIRW0NH83UQkp1Sw8Vk'))
    end

    def delete_identity(identity)
      create_connection.admin_delete_user({
                                            user_pool_id: "eu-west-1_RT0Kbu98Y",
                                            username: identity,
                                          })
    end
  end
end

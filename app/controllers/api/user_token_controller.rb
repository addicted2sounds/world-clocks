module Api
  class UserTokenController < Knock::AuthTokenController
    def entity_name
      'User'
    end
  end
end
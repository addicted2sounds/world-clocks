module Requests
  module Helpers
    def json
      JSON.parse(response.body)
    end

    def auth_headers(user)
      token = Knock::AuthToken.new(payload: { email: user.email }).token
      { HTTP_AUTHORIZATION: "Bearer #{token}" }
    end
  end
end

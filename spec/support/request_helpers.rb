module Requests
  module Helpers
    def json
      JSON.parse(response.body)
    end

    def data
      json['data']
    end

    def auth_headers(user)
      token = Knock::AuthToken.new(payload: { sub: user.id }).token
      { HTTP_AUTHORIZATION: "Bearer #{token}" }
    end
  end
end

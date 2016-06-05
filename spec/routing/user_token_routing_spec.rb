require 'rails_helper'

RSpec.describe Api::UserTokenController, type: :routing  do
  describe 'routing' do
    it 'routes to #create' do
      expect(post '/api/user_token').to route_to 'api/user_token#create'
    end
  end
end
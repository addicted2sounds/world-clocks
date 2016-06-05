require 'rails_helper'

RSpec.describe 'Timezones', :type => :request do
  let(:user) { create :user }

  describe 'GET /timezones' do
    it 'fails without authentication' do
      get timezones_path
      expect(response).to have_http_status(401)
    end

    context 'when validated' do
      context 'when no timezones defined' do
        it 'returns empty array' do
          get timezones_path, headers: auth_headers(user)
          p response.status
        end
      end
    end
  end
end

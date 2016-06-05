require 'rails_helper'

RSpec.describe 'Users', :type => :request do
  describe 'GET /users' do
    it 'fails without authentication' do
      get users_path
      expect(response).to have_http_status(401)
    end

    context 'when authenticated' do
      context 'when can manage users' do
        let(:user) { create :user, :admin }
        let(:request) { get users_path, headers: auth_headers(user) }

        it 'returns list of users' do
          request
          expect(json['data'].count).to eq 1
        end
      end
    end
  end
end

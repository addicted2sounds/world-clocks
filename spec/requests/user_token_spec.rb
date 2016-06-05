require 'rails_helper'

RSpec.describe 'User token', type: :request do
  let(:user) { create :user }
  let(:valid_credentials) { { email: user.email, password: user.password } }
  let(:invalid_credentials) { { email: '', password: '' } }
  describe 'POST /user_token' do
    context 'when valid credentials' do
      before :each do
        post '/user_token', params: { auth: valid_credentials }
      end
      it 'responds with token' do
        expect(json).to include 'jwt'
      end
    end

    context 'when invalid credentials' do
      before :each do
        post '/user_token', params: { auth: invalid_credentials }
      end

      it 'set unauthorized status' do
        expect(response.status).to eq 404
      end
    end
  end
end
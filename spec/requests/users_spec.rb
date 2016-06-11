require 'rails_helper'

RSpec.describe 'Users', :type => :request do
  let(:user) { create :user }
  let(:valid_attributes) { attributes_for :user }
  let(:invalid_attributes) { attributes_for :user, email: '' }
  describe 'GET /users' do
    it 'fails without authentication' do
      get api_users_path
      expect(response).to have_http_status(401)
    end

    context 'when authenticated' do
      let(:request) { get api_users_path, headers: auth_headers(user) }
      context 'when forbidden to manage users' do
        let(:user) { create :user }

        it 'raise error' do
          expect { request }.to raise_error Pundit::NotAuthorizedError
        end
      end

      context 'when can manage users' do
        let(:user) { create :user, :admin }

        it 'returns list of users' do
          request
          expect(data.count).to eq 1
        end
      end
    end
  end

  describe 'GET /users/:id' do

  end

  describe 'GET /users/current' do
    let(:req) { get current_api_users_url, headers: auth_headers(user) }
    it 'is rejected without authentication' do
      get current_api_users_url
      expect(response).to have_http_status 401
    end

    it 'render current user' do
      req
      expect(data).to be_a Hash
    end
  end

  describe 'POST /api/users' do
    context 'when valid attributes' do
      let(:request) { post api_users_path, params: { user: valid_attributes } }
      it 'creates new user' do
        expect { request }.to change(User, :count).by 1
      end
    end

    context 'when invalid attributes' do
      let(:request) { post api_users_path, params: { user: invalid_attributes } }
      it 'returns unprocessable entity status' do
        request
        expect(response).to have_http_status 422
      end
    end
  end

  describe 'PATCH /users/:id' do
    context 'when valid attributes' do
      let(:request) do
        patch api_user_path(user),
              params: { data: { attributes: valid_attributes }},
              headers: auth_headers(user)
      end

      it 'updates user' do
        request
        expect(User.last.email).to eq valid_attributes[:email]
      end
    end

    context 'when invalid attributes' do
      let(:request) do
        patch api_user_path(user),
              params: { data: { attributes: invalid_attributes }},
              headers: auth_headers(user)
      end

      it 'has unprocessable entity status' do
        request
        expect(response).to have_http_status 422
      end
    end
  end

  describe 'DELETE /users/:id' do
    let!(:user) { create :user }

    let(:request) do
      delete api_user_path(user), headers: auth_headers(user)
    end

    it 'is rejected without authentication' do
      delete api_user_path(user)
      expect(response).to have_http_status(401);
    end

    it 'removes record' do
      expect { request }.to change(User, :count).by -1
    end
  end
end

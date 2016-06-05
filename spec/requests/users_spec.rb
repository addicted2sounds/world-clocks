require 'rails_helper'

RSpec.describe 'Users', :type => :request do
  let(:user) { create :user }
  let(:valid_attributes) { attributes_for :user }
  let(:invalid_attributes) { attributes_for :user, email: '' }
  describe 'GET /users' do
    it 'fails without authentication' do
      get users_path
      expect(response).to have_http_status(401)
    end

    context 'when authenticated' do
      let(:request) { get users_path, headers: auth_headers(user) }
      context 'when forbidden to manage users' do
        let(:user) { create :user }

        it 'returns forbidden status' do
          request
          expect(response.status).to eq 303
        end
      end

      context 'when can manage users' do
        let(:user) { create :user, :admin }

        it 'returns list of users' do
          request
          expect(json['data'].count).to eq 1
        end
      end
    end
  end

  describe 'POST /users' do
    context 'when valid attributes' do
      let(:request) { post users_path, params: { user: valid_attributes } }
      it 'creates new user' do
        expect { request }.to change(User, :count).by 1
      end
    end

    context 'when invalid attributes' do
      let(:request) { post users_path, params: { user: invalid_attributes } }
      it 'returns unprocessable entity status' do
        request
        expect(response).to have_http_status 422
      end
    end
  end

  describe 'PATCH /users/:id' do
    context 'when valid attributes' do
      let(:request) do
        patch user_path(user), params: { user: valid_attributes },
              headers: auth_headers(user)
      end

      it 'updates user' do
        request
        expect(User.last.email).to eq valid_attributes[:email]
      end
    end

    context 'when invalid attributes' do
      let(:request) do
        patch user_path(user), params: { user: invalid_attributes },
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
      delete user_path(user), headers: auth_headers(user)
    end

    it 'removes record' do
      expect { request }.to change(Timezone, :count).by -1
    end
  end
end

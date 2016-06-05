require 'rails_helper'

RSpec.describe 'Timezones', :type => :request do
  let(:user) { create :user }
  let(:timezone) { create :timezone, user: user }
  let(:valid_attributes) { attributes_for :timezone }
  let(:invalid_attributes) { attributes_for :timezone, name: '' }

  describe 'GET /timezones' do
    it 'fails without authentication' do
      get timezones_path
      expect(response).to have_http_status(401)
    end

    context 'when validated' do
      let(:request) { get timezones_path, headers: auth_headers(user) }

      context 'when no timezones defined' do
        it 'returns empty array' do
          request
          expect(json['data']).to eq []
        end
      end

      context 'when has timezones' do
        before(:each) { create :timezone, user: user }

        it 'has timezone' do
          request
          expect(json['data'].count).to eq 1
        end
      end
    end
  end

  describe 'POST /timezones' do
    it 'fails without authentication' do
      post timezones_path
      expect(response).to have_http_status(401)
    end

    context 'when authenticated' do
      let(:request) do
        post '/timezones', params: { timezone: valid_attributes },
             headers: auth_headers(user)
      end

      context 'with valid attributes' do
        it 'creates timezone record' do
          expect { request }.to change(Timezone, :count).by 1
        end
      end

      context 'with invalid attributes' do
        let(:request) do
          post '/timezones', params: { timezone: invalid_attributes },
               headers: auth_headers(user)
        end

        it 'set unprocessable status' do
          request
          expect(response.status).to eq 422
        end
      end
    end
  end

  describe 'PATCH /timezones/:id' do

    it 'fails without authentication' do
      patch timezone_path(timezone)
      expect(response).to have_http_status(401)
    end

    context 'when authenticated' do
      context 'with valid attributes' do
        let(:request) do
          post '/timezones', params: { timezone: valid_attributes },
               headers: auth_headers(user)
        end

        it 'updates user record' do
          request
          expect(Timezone.last.name).to eq valid_attributes[:name]
        end
      end
    end
  end
end

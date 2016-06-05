require 'rails_helper'

RSpec.describe 'Timezones', :type => :request do
  let(:user) { create :user }
  let(:valid_attributes) { attributes_for :timezone }

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
    end
  end
end

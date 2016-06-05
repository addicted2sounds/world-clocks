require 'rails_helper'

RSpec.describe 'Timezones', :type => :request do
  let(:user) { create :user }

  describe 'GET /timezones' do
    it 'fails without authentication' do
      get timezones_path
      expect(response).to have_http_status(401)
    end

    context 'when validated' do
      before :each do
        get timezones_path, headers: auth_headers(user)
      end

      context 'when no timezones defined' do
        it 'returns empty array' do
          expect(json['data']).to eq []
        end
      end

      context 'when has timezones' do
        before(:each) { create :timezone, user: user }

        it 'has timezone' do
          expect(json['data'].count).to eq 1
        end
      end
    end
  end
end

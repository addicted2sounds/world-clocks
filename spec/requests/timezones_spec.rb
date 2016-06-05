require 'rails_helper'

RSpec.describe 'Timezones', :type => :request do
  describe 'GET /timezones' do
    it 'works! (now write some real specs)' do
      get timezones_path
      expect(response).to have_http_status(200)
    end
  end
end

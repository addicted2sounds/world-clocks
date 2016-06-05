require 'rails_helper'

RSpec.describe Api::TimezonesController, :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/api/timezones').to route_to('api/timezones#index')
    end

    it 'routes to #show' do
      expect(:get => '/api/timezones/1').to route_to('api/timezones#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/api/timezones').to route_to('api/timezones#create')
    end

    it 'routes to #update' do
      expect(:put => '/api/timezones/1').to route_to('api/timezones#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/api/timezones/1').to route_to('api/timezones#destroy', :id => '1')
    end

  end
end

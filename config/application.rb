require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WorldTimes
  class Application < Rails::Application

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [
            :get, :post, :put, :patch, :delete, :options
        ]
      end
    end

    config.api_only = true
    config.generators do |g|
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
      g.helper_specs false
      g.orm :active_record
    end
  end
end

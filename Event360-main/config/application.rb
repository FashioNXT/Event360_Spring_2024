require_relative "boot"

require "rails/all"
require "csv"
# require 'rack-cors'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FashioNXT
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.to_prepare do
      # Only Applications list
      Doorkeeper::ApplicationsController.layout "application"
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Rails.application.config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*', 
    #     headers: :any,
    #     methods: [:get, :post, :patch, :put, :delete, :options, :head], 
    #     credentials: false
    #   end
    # end

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)

      # Check if PROMOTED_APPS is set. If not, set it with the default 3 apps
      ENV['PROMOTED_APPS'] = "CastNXT,EventNXT,PlaNXT" if ENV['PROMOTED_APPS'].nil?
    end
  end
end



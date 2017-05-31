require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SalesforceConnect
  class Application < Rails::Application
    Dotenv::Railtie.load
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths += %W(#{config.root}/lib)
    config.sass.preferred_syntax = :sass
    config.sass.line_comments = false
    config.sass.cache = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    Restforce.configure do |config|
      config.api_version = '38.0'
      config.username = ENV["SF_USERNAME"]
      config.password = ENV["SF_PASS"]
      # ...
    end
  end
end

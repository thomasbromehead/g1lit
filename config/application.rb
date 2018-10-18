require_relative 'boot'

require 'rails/all'
require "attachinary/orm/active_record" # active_record or mongoid

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Log1
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    #Don't generate helpers when creating controllers
    config.generators.helper = false

    #Set up email service for development mode
    config.action_mailer.default_url_options = {
      host: 'http://g1lit.fr'
    }
    #Provide queue adapter for background jobs with sidekiq
    config.active_job.queue_adapter = :sidekiq

    config.autoload_paths << "#{Rails.root}/app/uploaders"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

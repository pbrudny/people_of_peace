require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PeopleOfPeace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :pl
    config.paths.add File.join('app', 'services'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'services', '*')]

    Raven.configure do |config|
      config.dsn = ENV['SENTRY_ID']
      config.environments = ['staging', 'production']
    end
  end
end

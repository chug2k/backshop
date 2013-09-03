require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Backshop
  class Application < Rails::Application

    Jbuilder.key_format camelize: :lower

    Paperclip.options[:command_path] = "/usr/local/bin/"
    config.paperclip_defaults = {
        :storage => :s3,
        :s3_credentials => {
            :bucket => 'stinkyshop',
            :access_key_id => 'AKIAJTL2XNULP44DJJ4A',
            :secret_access_key => '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'
        }
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end

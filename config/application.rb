require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(*Rails.groups)

module Colorideo
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.action_mailer.default_url_options = { host: 'localhost:3000' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = { address: ENV['SENDGRID_HOST'],
                                           port: ENV['SENDGRID_PORT'],
                                           domain: 'stalk-photos@example.com',
                                           password: ENV['SMTP_PASSWORD'],
                                           user_name: ENV['SMTP_USERNAME'],
                                           authentication: 'plain',
                                           enable_starttls_auto: true
                                         }
  end
end

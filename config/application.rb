require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(*Rails.groups)

module Colorideo
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = { address: 'smtp.mandrillapp.com'}
  end
end

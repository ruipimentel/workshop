require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Site
  class Application < Rails::Application    
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.assets    =   false
      g.helper    =   false
      g.jbuilder  =   false

      g.test_framework :rspec,        
        view_specs:    false,
        routing_specs: false,
        request_specs: false

    end
  end
end

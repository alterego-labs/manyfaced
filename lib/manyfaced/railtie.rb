module Manyfaced
  class Railtie < Rails::Railtie
    config.after_initialize do
      ActiveSupport.on_load(:action_controller) do
        extend Manyfaced::Helpers::Controller::SettingRenderContext
      end
    end
  end
end

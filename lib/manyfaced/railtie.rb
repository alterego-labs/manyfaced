module Manyfaced
  class Railtie < Rails::Railtie
    initializer 'manyfaced.action_controller' do
      ActiveSupport.on_load(:action_controller) do
        include Manyfaced::Helpers::Controller::SettingRenderContext
      end
    end
  end
end

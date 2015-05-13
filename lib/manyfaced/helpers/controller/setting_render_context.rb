module Manyfaced
  module Helpers
    module Controller
      module SettingRenderContext
        extend ActiveSupport::Concern

        included do
          before_action :manyfaced_set_current_render_context
        end

        def manyfaced_set_current_render_context
          Manyfaced::Config.render_context = view_context
        end
      end
    end
  end
end

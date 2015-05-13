module Manyfaced
  module Helpers
    module Controller
      module SettingRenderContext
        def self.extended(base)
          base.send :eval, <<-CODE
            before_action :manyfaced_set_current_render_context
          CODE
          base.send :define_method, :manyfaced_set_current_render_context do
            Manyfaced::Config.render_context = view_context
          end
        end
      end
    end
  end
end

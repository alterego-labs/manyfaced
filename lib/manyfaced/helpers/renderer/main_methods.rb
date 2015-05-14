module Manyfaced
  module Helpers
    module Renderer
      module MainMethods
        protected

        def render(template, options = {})
          render_in_context custom_opts(template, options)
        end

        def self_opts(template, options = {})
          render_params.gen_self template, options
        end

        def custom_opts(template, options)
          render_params.gen_custom template, options
        end

        def render_in_context(opts)
          render_context.render(opts).html_safe
        end

        def render_context
          Manyfaced::Config.render_context
        end

        def render_params
          @_render_params ||= Manyfaced::Helpers::Renderer::Parameters.new(model)
        end
      end
    end
  end
end

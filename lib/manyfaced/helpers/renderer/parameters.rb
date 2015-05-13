require 'active_support/core_ext/string/inflections'

module Manyfaced
  module Helpers
    module Renderer
      # Parameter generator for model renderer
      class Parameters
        attr_reader :model

        def initialize(model)
          @model = model
        end

        def gen_custom(name, options = {})
          render_params custom_view_path(name), options
        end

        def gen_self(name, options = {})
          render_params self_view_path(name), options
        end

        private

        def resource_name
          model.class.name.underscore.gsub('_renderer', '')
        end

        def plural_resource_name
          resource_name.pluralize
        end

        def custom_view_path(name)
          make_path_for :shared, name
        end

        def self_view_path(name)
          make_path_for :render, name
        end

        def make_path_for(type, name)
          "#{plural_resource_name}/#{type}/#{name}"
        end

        def render_params(partial, options = {})
          partial_opts(partial).merge opts_with_resource(options)
        end

        def opts_with_resource(options = {})
          { locals: resource_opts.merge(options) }
        end

        def partial_opts(name)
          { partial: name }
        end

        def resource_opts
          { :"#{resource_name}" => model }
        end
      end
    end
  end
end

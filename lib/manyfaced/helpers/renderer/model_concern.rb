require 'active_support/core_ext/string/inflections'

module Manyfaced
  module Helpers
    module Renderer
      module ModelConcern
        extend ActiveSupport::Concern

        included do
          alias :model :__getobj__
        end

        def initialize(base = nil)
          super(base || self.class.default_base)
        end

        def method_missing(meth, *args, &_blk)
          Manyfaced::Helpers::Renderer::MethodDispatcher.new(self, model).call meth, *args
        end

        module ClassMethods
          def default_base
            @_model_class ||= resource_name.constantize
          end

          protected

          def resource_name
            name.gsub(/[A-Z][a-z0-9]+$/, '')
          end

          def extension_type
            name.scan(/[A-Z][a-z0-9]+/).last.downcase
          end
        end
      end
    end
  end
end

require 'active_support/core_ext/string'

module Manyfaced
  module Concerns
    # Represents behavior for building model's concerns
    #
    # ==== Examples
    #
    # # Lets introduce own concerns named Activable.
    # # For first define concerning module:
    # module Concerns
    #   module Activable
    #     extend Manyfaced::Concerns::Base
    #     build_concern :active
    #   end
    # end
    # # Include created concern to goal class
    # class User
    #   include Concerns::Activable
    # end
    # # Add Activable concern class
    # class UserActive < SimpleDelegator
    # end
    # # And now all methods from UserActive class will be available
    # # on User instance
    module Base
      def build_concern(name)
        class_eval <<-CODE
          def #{name}; @_#{name} ||= new_#{name}; end
          #{code_method_missing(name)}
          private
          def new_#{name}
            \"\#{self.class.name}#{name.to_s.classify}\".constantize.new self
          end
        CODE
      end

      private

      def code_method_missing(name)
        <<-CODE
          def method_missing(m, *args, &block)
            #{name}.send m, *args, &block
          end
        CODE
      end
    end
  end
end

require 'delegate'

module Manyfaced
  # A base class for Renderer layer takes ability for model self-rendering
  # and rendering partials associated with this model instance
  class Renderer < SimpleDelegator
    include Manyfaced::Helpers::Renderer::MainMethods
    include Manyfaced::Helpers::Renderer::ModelConcern

    # Defining rendering methods.
    #
    # ==== Attributes
    #
    # * +name+ - name of rendering view
    # * +&block+ - body of rendering procedure
    #
    # ==== Examples
    #
    # # User has subscriptions and in the user cabinet they
    # # must be listed. Lets define rendering method:
    # render :subscriptions do
    #   render :subscriptions, {option1: value1}
    # end
    # # And then you may use defined method in the view:
    # = user.render_subscriptions
    def self.render(name, &block)
      define_method "render_#{name}" do |*args|
        instance_exec args, &block
      end
    end

    def rendering(as: :default, options: {})
      render_in_context self_opts(as, options)
    end

    protected

    def default_action(name, *_args)
      render name
    end
  end
end

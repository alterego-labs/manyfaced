require "manyfaced/version"

require 'active_support/core_ext/module'
require 'active_support/dependencies/autoload'

require 'manyfaced/railtie' if defined?(Rails)

module Manyfaced
  extend ActiveSupport::Autoload

  autoload :Config
  autoload :Renderer

  module Helpers
    module Controller
      extend ActiveSupport::Autoload

      autoload :SettingRenderContext
    end

    module Renderer
      extend ActiveSupport::Autoload

      autoload :MainMethods
      autoload :Parameters
      autoload :MethodDispatcher
      autoload :ModelConcern
    end
  end

  module Concerns
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Renderable
  end
end

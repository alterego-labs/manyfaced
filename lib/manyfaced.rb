require "manyfaced/version"

require 'active_support/core_ext/module'
require 'active_support/dependencies/autoload'

require 'manyfaced/railtie' if defined?(Rails)

module Manyfaced
  extend ActiveSupport::Autoload

  autoload :Config

  module Helpers
    module Controller
      extend ActiveSupport::Autoload

      autoload :SettingRenderContext
    end
  end
end

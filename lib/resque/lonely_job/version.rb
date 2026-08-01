# frozen_string_literal: true

module Resque
  module Plugins
    module LonelyJob
      # Version namespace for this gem.
      module Version
        # Current gem version.
        VERSION = "1.1.3"
      end
      # Current gem version exposed at the traditional constant location.
      VERSION = Version::VERSION # Traditional Constant Location
    end
  end
end

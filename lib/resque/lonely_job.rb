# frozen_string_literal: true

require "version_gem"
require_relative "lonely_job/version"

module Resque
  module Plugins
    module LonelyJob
    end
  end
end

Resque::Plugins::LonelyJob::Version.class_eval do
  extend VersionGem::Basic
end

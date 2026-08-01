# frozen_string_literal: true

require "open3"
require "rbconfig"
require "resque/plugins/lonely_job"

RSpec.describe Resque::Plugins::LonelyJob do
  it "loads the current LonelyJob implementation in a clean Ruby process" do
    program = <<~RUBY
      require "resque/plugins/lonely_job"
      plugin = Resque::Plugins::LonelyJob
      abort "LonelyJob implementation was not loaded" unless plugin.instance_methods(false).include?(:before_perform)
    RUBY
    _stdout, stderr, status = Open3.capture3(
      RbConfig.ruby,
      "-Ilib",
      "-e",
      program,
      chdir: File.expand_path("../../..", __dir__)
    )

    expect(status).to be_success, stderr
  end
end

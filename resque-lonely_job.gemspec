# -*- encoding: utf-8 -*-
require File.expand_path('../lib/resque-lonely_job/version', __FILE__)

Gem::Specification.new do |spec|
  spec.authors       = ["Jonathan R. Wallace"]
  spec.email         = ["jonathan.wallace@gmail.com"]
  spec.summary       = %q{A resque plugin that ensures that only one job for a given queue will be running on any worker at a given time.}
  spec.homepage      = "http://github.com/wallace/resque-lonely_job"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "resque-lonely_job"
  spec.require_paths = ["lib"]
  spec.version       = Resque::Plugins::LonelyJob::VERSION
  spec.license       = "MIT"

  spec.add_dependency 'resque', '>= 1.2'
  spec.add_development_dependency 'mock_redis'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0'
  spec.add_development_dependency 'timecop'

  spec.description   = <<desc
Ensures that for a given queue, only one worker is working on a job at any given time.

Example:

  require 'resque/plugins/lonely_job'

  class StrictlySerialJob
    extend Resque::Plugins::LonelyJob

    @queue = :serial_work

    def self.perform
      # only one at a time in this block, no parallelism allowed for this
      # particular queue
    end
  end
desc
end

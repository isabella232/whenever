require 'thread'
require 'active_support/version'

if ActiveSupport::VERSION::STRING >= "3.0.0"
  require "active_support/time"
else
  require "active_support"
end

module Whenever
  autoload :JobList,     'whenever/job_list'
  autoload :Job,         'whenever/job'
  autoload :CommandLine, 'whenever/command_line'
  
  module Output
    autoload :Cron,        'whenever/cron'
    autoload :Redirection, 'whenever/output_redirection'
  end
  
  def self.cron(options)
    Whenever::JobList.new(options).generate_cron_output
  end
  
  def self.path
    Dir.pwd
  end

  def self.rails3?
    File.exists?(File.join(path, 'script', 'rails'))
  end

  def self.bundler?
    File.exists?(File.join(path, 'Gemfile'))
  end
end

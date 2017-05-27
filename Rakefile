require "bundler/setup"
require "dslr_shop"
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "pry"
require "require_all"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  Pry.start
end

def reload!
  load_all "./lib"
end

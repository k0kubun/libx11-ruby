require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("libx11") do |ext|
  ext.lib_dir = "lib/libx11"
end

task :default => [:clobber, :compile, :spec]

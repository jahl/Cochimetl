 begin 
  require "bundler/gem_tasks"
  require "rspec/core/rake_task"
  require "Cochimetl/version"
  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
  task test: :spec

  task :build do
    system "gem build Cochimetl.gemspec"
  end

  task :release => :build do
    system "gem push Cochimetl-#{Cochimetl::VERSION}"
  end

  rescue LoadError
end
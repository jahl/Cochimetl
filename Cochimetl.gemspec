
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Cochimetl/version"
require "Cochimetl/web_service_client"
require "Cochimetl/exchange_rate"

Gem::Specification.new do |spec|
  spec.name          = "Cochimetl"
  spec.version       = Cochimetl::VERSION
  spec.authors       = ["Jahl", "Señor Perro"]
  spec.email         = ["JesusAHdzLpz@gmail.com", "we.yote@gmail.com"]
  
  spec.summary       = "A gem that facilitates the use of Banxico to get the exchange rates"
  spec.homepage      = "https://github.com/JahlHernandez/Cochimetl"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "savon", "~> 2.12.0"
end

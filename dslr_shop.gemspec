# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dslr_shop/version'

Gem::Specification.new do |spec|
  spec.name          = "dslr_shop"
  spec.version       = DslrShop::VERSION
  spec.authors       = ["sarjumulmi"]
  spec.email         = ["mulmi.sarju@gmail.com"]

  spec.summary       = %q{The best DSLR cameras in the world}
  spec.description   = %q{Provides a list of 24 of the best rated DSLR cameras per B & H Photography Store}
  spec.homepage      = "http://rubygems.org/gems/dslr_shop"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   << "dslr_shop"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_runtime_dependency "require_all"
  spec.add_runtime_dependency "colorize"
end

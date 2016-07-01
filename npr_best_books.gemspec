# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'npr_best_books/version'

Gem::Specification.new do |spec|
  spec.name          = "npr_best_books"
  spec.version       = NPRBestBooks::VERSION
  spec.authors       = ["beingy"]
  spec.email         = ["beingy@gmail.com"]

  spec.summary       = "CLI Gem to retrieve book recomendations from NPR's Book Concierge website."
  spec.description   = "NWelcome to my NPR Book Concierge CLI Gem.  Current version will check [NPR's Book Concierge website](http://apps.npr.org/best-books-2015) and retrieve 2015's book recommendations in the Science Fiction and Fantasy genre."
  spec.homepage      = "https://github.com/beingy/npr-best-books-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "bundler", "~> 1.12"
  spec.add_runtime_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "json", "~> 1.8"

end

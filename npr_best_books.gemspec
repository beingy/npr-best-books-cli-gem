# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'npr_best_books/version'

Gem::Specification.new do |spec|
  spec.name          = "npr_best_books"
  spec.version       = NPRBestBooks::VERSION
  spec.authors       = ["beingy"]
  spec.email         = ["beingy@gmail.com"]

  spec.summary       = "CLI Gem to list book recomendations from NPR's Book Concierge website."
  spec.description   = "A Simple CLI Gem to list NPR Book Concierge website's 2015 book recommendations in the Science Fiction and Fantasy genre."
  spec.homepage      = "https://github.com/beingy/npr-best-books-cli-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["npr_best_books"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "nokogiri", "~> 1.6"
  spec.add_runtime_dependency "json", "~> 1.8"

end

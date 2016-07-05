# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'npr_best_books/version'

Gem::Specification.new do |spec|
  spec.name          = "npr_best_books"
  spec.version       = NPRBestBooks::VERSION
  spec.authors       = ["beingy"]
  spec.email         = ["beingy@gmail.com"]

  spec.summary       = "CLI gem to list book recomendations from NPR's Book Concierge website."
  spec.description   = "A simple CLI gem to list NPR Book Concierge website's 2015 book recommendations by genre."
  spec.homepage      = "https://github.com/beingy/npr-best-books-cli-gem"
  spec.license       = "MIT"

  spec.files         = ["lib/npr_best_books.rb", "lib/npr_best_books/book.rb", "lib/npr_best_books/cli.rb", "lib/npr_best_books/list.rb", "lib/npr_best_books/scraper.rb", "lib/npr_best_books/version.rb", "bin/npr_best_books", "README.md", "Gemfile", "bin/setup", "bin/console"]
  spec.bindir        = "bin"
  spec.executables   = "npr_best_books"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "require_all" , "~> 1.3"
  spec.add_runtime_dependency "nokogiri", "~> 1.6"
  spec.add_runtime_dependency "json", "~> 1.8"

end

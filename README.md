# NPR Best Books

A simple CLI gem to list NPR Book Concierge website's 2015 book recommendations in the Science Fiction and Fantasy genre.

## Installation

Install by running the following:

    $ gem install npr_best_books

## Usage

After gem installation is completed, type `npr_best_books` in your bash command line to start the CLI gem.

    $ npr_best_books
    $ == Welcome to NPR's Book Concierge ==
    $ == A Guide to 2015's Great Reads ==
    $ Loading latest list...
    $ Loading books...
    $ ...

To exit CLI gem, type `exit` in the CLI command prompt.

Alternatively, you can run the CLI gem using IRB:

1) Run `irb`.

2) Enter `require 'npr_best_books'` and get a `true` as return value.

3) Enter `NPRBestBooks::CLI.new.call` to start the CLI gem.

For example,

    $ irb
    $ > require 'npr_best_books'
    $ => true
    $ > NPRBestBooks::CLI.new.call
    $ == Welcome to NPR's Book Concierge ==
    $ == A Guide to 2015's Great Reads ==
    $ Loading latest list...
    $ Loading books...
    $ ...

## Current Known Issues/Fixes

Running `gem install 'npr_best_books'` also installs an executable in your gem folder so you can run `npr-best-books` in your bash command line and attempt to use this CLI gem as is.  However, this executable is encountering the following message:

    $ cannot load such file -- ./lib/npr_best_books (LoadError)

Update: 7/5/2016 - Issue fixed by using the require_all gem seems to do the trick by adding `require 'require_all'` and `require_rel '../lib'` to the `bin/npr_best_books` executable file.  The environment file `lib/npr_best_books.rb` now `require_relative` all `*.rb` files.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/beingy/npr_best_books. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

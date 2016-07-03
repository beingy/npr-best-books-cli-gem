# NPR Best Books

A simple CLI gem to list NPR Book Concierge website's 2015 book recommendations in the Science Fiction and Fantasy genre.

## Installation

Install by running the following:

    $ gem install npr_best_books

## Usage

1) After installation is completed, start by running `IRB`:

    $ irb

2) Then require the newly install gem:

    $ > require 'npr_best_books'
    $  => true

NOTE: If after `requiring 'npr_best_books'` you do not get a `true` return value, please kindly let me know as you have encountered an error.

3) Run the following command in IRB to start CLI gem:

    $ > NPRBestBooks::CLI.new.call

4) Enjoy.

## Current Known Issues

Running `gem install 'npr_best_books'` also installs an executable in your gem folder so you can run `npr-best-books` in your bash command line and attempt to use this CLI gem as is.  However, this executable is encountering the following message:

    $ cannot load such file -- ./lib/npr_best_books (LoadError)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/beingy/npr_best_books. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

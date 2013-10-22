# LogRecursive

Command line utility that generates git logs for a given repo, including logs for any updated known dependencies. For now, only dependencies managed with bundler are supported.

## Installation

Install using:

    $ gem install log_recursive

## Usage

    $ logr <since>..<until>

Where since..until is the range of git refs that you want to generate logs for (See `git help log` for details)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

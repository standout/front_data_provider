# FrontDataProvider

Fetch data from FrontApp. Intended for display in a dashboard app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'front_data_provider', github: 'standout/front_data_provider
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install front_data_provider

## Usage

Grab your Front App token at https://app.frontapp.com/settings/tools/api

```
front = FrontDataProvider.new(token: 'retouch.conjoint.wickiup')
front.fetch  # => { data: [], expires_at: ... }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/standout/front_data_provider.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

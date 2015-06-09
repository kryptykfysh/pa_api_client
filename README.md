# PaApiClient

A Ruby wrapper for the Parallels APIs exposed by both POA and PBA.
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pa_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pa_api_client

## Usage

The two classes PaApiClient::POA and PaApiClient::PBA both require a :host
parameter in their ::new hash.

### POA

POA calls are made using POA#call, with the first argument being the method
name, as a String, (e.g. 'pem.getAccountSubscriptions') and the second argument
being a Hash of parameters (e.g. account_id: 1000001).

### PBA

PBA calls are made using PBA#call, with the first argument being the method
name, as a String (e.g. 'GetLoginSettings_API') and the second argument being
an Array of paramters (e.g. [1000002])

In the case of an error, the response will be a Base64 decoded.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pa_api_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

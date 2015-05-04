# Capistrano::Tempo

Notify Tempo about Capistrano deployments. These instructions are for Capistrano 3.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-tempo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-tempo

## Usage

Load this gem in Capfile:

```ruby
# Capfile
require 'capistrano/tempo'
```

Setup your Tempo credentials in `deploy.rb`

```ruby
set :tempo_url, "_YOUR_TEMPO_URL"
set :tempo_api_token, "_YOUR_API_TOKEN_HERE"
set :tempo_project, "My project ID or Slug"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
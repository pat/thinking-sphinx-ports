# ThinkingSphinx::Ports

Automatically assign Sphinx ports to multiple apps using Thinking Sphinx on the one machine. This is useful if you have many apps on your development machine that use Sphinx and Thinking Sphinx, and you don't want to worry about making sure the port you've assigned for it isn't being used elsewhere.

This library is aimed development and test environments - each app and environment gets a unique port, to avoid any conflicts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thinking-sphinx-ports', '~> 0.1.0', :groups => [:development, :test]
```

**This gem is not meant for use in production environments.** Indeed, it may override your environment-specific settings, so make sure you be specific in the environments it should be loaded within.

## Usage

Beyond adding it to your Gemfile, there's nothing else you need to do for Rails applications. Thinking Sphinx will automatically be assigned a unique port based on its environment and path.

If you have Sphinx daemons running on your machine already, stopping those daemons and then running `rake ts:configure ts:start` is recommended - this will have the daemon using their newly assigned port.

If you want to use this gem with non-Rails apps, then you'll want something along the lines of this code to run while you're app is booting up:

```ruby
# for non-Rails apps only
ThinkingSphinx::Ports.call [Dir.pwd, ENV['RACK_ENV']]
```

Modify those variables as you wish - the important part is that overall argument for `ThinkingSphinx::Ports.call` be unique for the given app and environment.

For the extra curious, the path/environment and port pairings are saved to `~/.thinking_sphinx_ports.yml`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pat/thinking-sphinx-ports. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Licence

Copyright (c) 2016, ThinkingSphinx::Ports is developed and maintained by Pat Allan, and is released under the open MIT Licence.

# Rotozipper

Rotozipper is a simple Ruby gem which aims to simplify log rotatio and zipping.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rotozipper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rotozipper

## Usage

Usage is simple.
The gem provides a method `launch` of the `Rotozipper` module which takes three arguments:

* `glob_path` (required): the path in glob form of the folder where your logs are stored. For example, in a Rails application, you can set it to `log/*.log`.
* `output_path` (optional): the path where you want to save the rotozipped logs. Defaults to a relative `history` folder.
* `logger_path` (optional): the path of a log file where you want to store Rotozipper's operative logs. Defaults to `STDOUT`.

For example, to rotozip logs of a Rails application, you can execute:

```ruby
Rotozipper.launch 'log/*.log', 'log/history'
```

This command will compress all the `*.log` files in the `log` folder, and the move them to `log/history` folder, adding a timestamp to keep track of the moment. The original files will be truncated to 0 bytes.

## Scheduling - Rails

Rotozipper has `whenever` as a gem dependency, so if you need to schedule the rotozipping of your logs, you can simply create a file named `config/schedule.rb` in your Rails application, and then add the following lines:

```ruby
# config/schedule.rb

every :week, at: '00:00' do
  runner %{ Rotozipper.launch 'log/*.log', 'log/history' }
end
```

And then schedule it by running the command `whenever --update-crontab`.
Please refer to [whenever](https://github.com/javan/whenever) documentation to know more about it features.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Pluve/rotozipper.

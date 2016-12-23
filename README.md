# friendly_timestamp

A gem for display time and date based on local time zone in verbal informal saying like more than two day ago, less one week ago...etc.
It also provides method for full format of date and time in local time zone as well.

![alt tag](/assets/images/example_use.png)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'friendly_timestamp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install friendly_timestamp

Include javascript file in `application.js`:
```ruby
  //= require friendly_timestamp
```

## Usage

Once you have `DateTime` object from Rails `ActiveSupport`, you can call instance method directly from the object. Supposed we create new `DateTime` object:
```ruby
my_date_time = DateTime.new(2016,2,29,0,0,6,'+06:00')
```
Here are examples of available methods:

* To display friendly verbal format appropriately based on the difference between current time such as a moment ago, less than 1 year ago...etc. It is based on how long it is.
```ruby
my_date_time.friendly_format
```
* To display format in minute such as more than 50 minutes ago, less than 15 minutes ago...etc.
```ruby
my_date_time.minute_format
```
* To display format in hour such as more than 20 hours ago, less than 2 hours ago...etc.
```ruby
my_date_time.hour_format
```
* To display format in day such as more than 5 days ago, less than 3 days ago...etc.
```ruby
my_date_time.day_format
```
* To display format in week such as more than 1 week ago, less than 2 weeks ago...etc.
```ruby
my_date_time.week_format
```
* To display format in month such as more than 5 months ago, less than 10 months ago...etc.
```ruby
my_date_time.month_format
```
* To display format in year such as more than 1 year ago, less than 15 minutes ago...etc.
```ruby
my_date_time.year_format
```
* To display full format otherwise such as Thu, Nov 17th 2016 at 17:50 UTC...etc. It accepts parameter as offset in minutes between UTC and local time. Otherwise, the default is `0`. For example, if local time is CST (UTC-6), so the offset is `360`. If local time is Indochina Time (UTC+7), so the offset is `-420`. If you want to dynamically display time based on each user timezone, we also provide a browser cookie for parameter, `cookies[:fts_offset]`. It triggers the value of offset from user browser when they access the application. Here are examples of possible valid method calls:
```ruby
my_date_time.full_format
my_date_time.full_format(360)
my_date_time.full_format(-420)
my_date_time.full_format(cookies[:fts_offset])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kuroun/friendly_timestamp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

require "friendly_timestamp/version"

#module FriendlyTimestamp
  # Your code goes here...
  ONE_MINUTE = 60
  ONE_HOUR = ONE_MINUTE * 60
  ONE_DAY = ONE_HOUR * 24
  ONE_WEEK = ONE_DAY * 7
  ONE_MONTH = ONE_DAY * 30
  ONE_YEAR = ONE_DAY * 365

  class Time

    def friendly_timestamp
    # convert time to local time
    # using minute format if less hour
    # using hour format if less than a day
    # using full format otherwise (Thurs, Nov 12th 2016)
      case (Time.now - self).to_i.abs
      when 0...ONE_MINUTE
        'a moment ago'
      when ONE_MINUTE...ONE_HOUR
        self.minute_format
      when ONE_HOUR...ONE_DAY
        self.hour_format
      when ONE_DAY...ONE_WEEK
        self.day_format
      when ONE_WEEK...ONE_MONTH
        self.week_format
      when ONE_MONTH...ONE_YEAR
        self.month_format
      when ONE_YEAR...ONE_YEAR * 5
        self.year_format
      else
        self.full_format
      end
    end
  end
#end

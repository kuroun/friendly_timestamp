require "friendly_timestamp/version"
require "active_support/all"
require "pry"

#module FriendlyTimestamp
  # Your code goes here...
  ONE_MINUTE = 60
  ONE_HOUR = ONE_MINUTE * 60
  ONE_DAY = ONE_HOUR * 24
  ONE_WEEK = ONE_DAY * 7
  ONE_MONTH = ONE_DAY * 30
  ONE_YEAR = ONE_DAY * 365

  class Time

    def friendly_format
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

    def to_local_time
      #binding.pry
      self.in_time_zone(local_time_zone_offset)
    end

    def minute_format
      in_minutes = (Time.now.to_local_time - self.to_local_time).to_f.abs / ONE_MINUTE
      "#{word_form(in_minutes, 'minute')} ago"
    end

    def hour_format
      in_hours = (Time.now.to_local_time - self.to_local_time).to_f.abs / ONE_HOUR
      "#{word_form(in_hours, 'hour')} ago"
    end

    def day_format
      in_days = (Time.now.to_local_time - self.to_local_time).to_f.abs / ONE_DAY
      "#{word_form(in_days, 'day')} ago"
    end

    def week_format
      in_weeks = (Time.now.to_local_time - self.to_local_time).to_f.abs / ONE_WEEK
      "#{word_form(in_weeks, 'week')} ago"
    end

    def month_format
      in_months = (Time.now.to_local_time - self.to_local_time).to_f.abs / ONE_MONTH
      "#{word_form(in_months, 'month')} ago"
    end

    def year_format
      in_years = (Time.now.to_local_time - self.to_local_time).to_f.abs / ONE_YEAR
      "#{word_form(in_years, 'year')} ago"
    end

    def full_format
      formatted_time = self.to_local_time
      formatted_time.strftime("%a, %b #{formatted_time.day.ordinalize} %Y at %H:%M")
    end

    private

    def word_form(num, word)
      word = num.round > 1 ? word.pluralize : word.singularize
      num > num.round ? "more than #{num.round} #{word}" : "less than #{num.round} #{word}"
    end

    def local_time_zone_offset
      # multiplle -1 here because js represent time difference varies from how rails represents
      # get offset in hour
      return (defined? cookies[:time_zone_offset_utc_mn]) ? (-1 * cookies[:time_zone_offset_utc_mn].to_f / 60) : 0
    end
  end
#end

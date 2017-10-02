require 'spec_helper'

describe Time do
  it 'has a version number' do
    expect(FriendlyTimestamp::VERSION).not_to be nil
  end

  describe 'word_form' do
    # make sure that return more than or less than phrase
    # make sure that number is no decimal form
    # make sure that it returns appropriate singular and plural form of word
    word = 'minute'
    context 'when number after decimal point is equal or more than 5' do
      num = 1.5
      it 'is supposed to be rounded up' do
        expect(Time.now.word_form(num, word)).to eq 'less than 2 minutes'
      end
    end

    context 'when number after decimal point is less than 5' do
      num = 1.4
      it 'is supposed to be rounded down' do
        expect(Time.now.word_form(num, word)).to eq 'more than 1 minute'
      end
    end
  end

  describe '#friendly_format' do
    context 'when less than a minute' do
      time = Time.now - 30
      it 'returns string of moment ago' do
        expect(time.friendly_format).to eq 'a moment ago'
      end
    end

    context 'when from 1 minute to less 60 minute' do
      time = Time.now - 60
      it 'returns in minute format' do
        expect(time.friendly_format).to include '1 minute ago'
      end
    end

    context 'when from 1 hour to less than 24 hours' do
      time = Time.now - 60 * 60
      it 'returns in hour format' do
        expect(time.friendly_format).to include '1 hour ago'
      end
    end

    context 'when from 1 day to less than 7 days' do
      time = Time.now - 60 * 60 * 24
      it 'return in day format' do
        expect(time.friendly_format).to include '1 day ago'
      end
    end

    context 'when from 1 week to less than 4 weeks' do
      time = Time.now - 60 * 60 * 24 * 7
      it 'returns in week format' do
        expect(time.friendly_format).to include '1 week ago'
      end
    end

    context 'when from 1 month to less than 12 months' do
      time = Time.now - 60 * 60 * 24 * 30
      it 'returns in month format' do
        expect(time.friendly_format).to include '1 month ago'
      end
    end

    context 'when from 1 year to less than 5 years' do
      time = Time.now - 60 * 60 * 24 * 365
      it 'returns in year format' do
        expect(time.friendly_format).to include '1 year ago'
      end
    end

    context 'when more than or equal 5 years' do
      time = Time.now - 60 * 60 * 24 * 365 * 5
      it 'returns full format' do
        # match regular expression (Thu, Nov 17th 2016 at 17:50 UTC)
        expect(time.friendly_format).to match(/((Sun)|(Mon)|(Tue)|(Wed)|(Thu)|(Fri)|(Sat))(,\s)((Jan)|(Feb)|(Mar)|(Apr)|(May)|(Jun)|(Jul)|(Aug)|(Sep)|(Oct)|(Nov)|(Dec))(\s)[0-9]{1,2}((st)|(nd)|(rd)|(th))(\s)[0-9]{4}(\s)(at)(\s)[0-9]{1,2}(:)[0-9]{1,2}(\s)[A-Z]{3}/)
      end
    end
  end
end

require 'friendly_timestamp/engine'
require 'friendly_timestamp/version'
require 'core_extensions/time/friendly_timestamp'
require 'active_support/all'

Time.include CoreExtensions::Time::FriendlyTimestamp

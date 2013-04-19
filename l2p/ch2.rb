#!/usr/bin/env ruby

HOURS_PER_DAY = 24
DAYS_PER_YEAR = 365.242
HOURS_PER_YEAR = HOURS_PER_DAY * DAYS_PER_YEAR

puts "Hours in a year = #{HOURS_PER_YEAR}"

MINUTES_PER_HOUR = 60
YEARS_PER_DECADE = 10

puts "Minutes in a decade = #{MINUTES_PER_HOUR * HOURS_PER_YEAR * YEARS_PER_DECADE}"

SECONDS_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR * 60
BIRTH_DATETIME = "1971-06-06 03:45:00 +1000"

require 'date'
days_since_birth = DateTime.now - DateTime.parse( BIRTH_DATETIME)

puts "My age in seconds is: #{(days_since_birth * SECONDS_PER_DAY).to_i}"

SECONDS_PER_YEAR = SECONDS_PER_DAY * DAYS_PER_YEAR
AUTHORS_AGE_IN_SECS = 1_025_000_000

puts "Author's age: #{(AUTHORS_AGE_IN_SECS / SECONDS_PER_YEAR).to_i}"

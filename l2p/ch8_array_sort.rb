#!/usr/bin/env ruby

words = []

while ( word = gets.chomp ) != ""
  words << word
end

puts words.sort

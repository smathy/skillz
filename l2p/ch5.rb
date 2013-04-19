#!/usr/bin/env ruby

names = { first: nil, middle: nil, last: nil }
names.each do |k, v|
  print "What's your #{k} name? "
  names[k] = gets.chomp
end

puts "Well hello there #{names.values.join ' '}"

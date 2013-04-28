#!/usr/bin/env ruby

CHAPTERS = [
  { name: "Getting Started", page: 1 },
  { name: "Numbers", page: 9 },
  { name: "Letters", page: 13 },
]

WIDTH = `tput cols`.to_i - 50

puts "Table of Contnts".center(WIDTH)
CHAPTERS.each_with_index do |e, i|
  puts "Chapter #{i+1}:  #{e[:name]}".ljust(WIDTH/2) + ( "page".ljust(4) + e[:page].to_s.rjust(3) ).rjust(WIDTH/2)
end

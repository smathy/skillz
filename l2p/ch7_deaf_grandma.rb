#!/usr/bin/env ruby

while true
  question = gets.chomp

  if question == "BYE"
    exit
  elsif question.upcase == question
    puts "NO, NOT SINCE #{rand 1930..1950}!"
  else
    puts "HUH?! SPEAK UP, SONNY!"
  end
end

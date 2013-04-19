#!/usr/bin/env ruby

while true
  question = gets.chomp

  if question == "BYE"
    exit
  elsif question.upcase == question
    puts "NO, NOT SINCE 1938!"
  else
    puts "HUH?! SPEAK UP, SONNY!"
  end
end

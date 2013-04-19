#!/usr/bin/env ruby

bye_count = 0
while true
  question = gets.chomp

  if question == "BYE"
    if ( bye_count += 1 ) >= 3
      exit
    end
  else
    bye_count = 0
  end

  if question.upcase == question
    puts "NO, NOT SINCE #{rand 1930..1950}!"
  else
    puts "HUH?! SPEAK UP, SONNY!"
  end
end

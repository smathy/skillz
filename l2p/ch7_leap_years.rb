#!/usr/bin/env ruby

print "Starting year: "
year_s = gets.chomp.to_i

print "Ending year: "
year_e = gets.chomp.to_i

(year_s..year_e).each do |y|
  if y % 400 == 0 || ( y % 4 == 0 && y % 100 != 0 )
    puts y
  end
end

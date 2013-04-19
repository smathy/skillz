#!/usr/bin/env ruby

BOTTLES = 99

def p i
  "#{i} bottle" + ( i == 1 ? '' : 's' )
end

def no_more i
  ( i == 0 ? "no more" : i )
end

def verse i
  b_current = no_more i
  b_next = no_more i - 1
  b_next_pre = "Take one down and pass it around"

  if i == 0
    b_next = BOTTLES
    b_next_pre = "Go to the store and buy some more"
  end

  <<-__EOI
    #{(p b_current).capitalize} of beer on the wall, #{p b_current} of beer.
    #{b_next_pre}, #{p b_next} of beer on the wall.
  __EOI
end

puts
BOTTLES.downto(0) do |b|
  puts verse b
  puts
end

#!/usr/bin/env ruby

x = []
50.times do |i|
  x << rand( 100)
end

x.sort!

def shuffle arr
  shuffled = []
  a = arr.clone
  while a.length > 0 
    shuffled << a.delete_at(rand(a.length))
  end
  shuffled
end

puts shuffle(x).join(', ')

#!/usr/bin/env ruby

puts "Enter some words..."
arr = STDIN.read.split "\n"

def normal_sort unsorted
  sorted = [ unsorted.pop ]
  unsorted.each do |t|
    catch :next_unsorted do
      0.upto(sorted.length-1) do |i|
        if sorted[i] >= t
          sorted[i,0] = t
          throw :next_unsorted
        end
      end
      sorted.push t
    end
  end
  sorted
end

puts "And the sorted words now: " + normal_sort(arr).join(", ")

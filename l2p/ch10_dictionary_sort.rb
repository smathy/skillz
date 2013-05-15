#!/usr/bin/env ruby

puts "Enter some words..."
arr = STDIN.read.split "\n"

def normal_sort unsorted
  sorted = []
  unsorted.each do |t|
    catch :next_unsorted do
      sorted.each_index do |i|
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

puts "Sorted non-recursively:"
puts "\t" + normal_sort(arr).join(", ")

def recursive_sort unsorted_array
  _recursive_sort unsorted_array, []
end

def _recursive_sort unsorted, sorted
  if needle = unsorted.pop
    catch :next_unsorted do
      sorted.each_with_index do |e, i|
        if e.downcase >= needle.downcase
          sorted[i,0] = needle
          throw :next_unsorted
        end
      end
      sorted.push needle
    end
    _recursive_sort unsorted, sorted
  else
    return sorted
  end
end

puts
puts "Sorted recursively..."
puts "\t" + recursive_sort(arr.clone).join(", ")

def bubble_sort arr, i=0
  return arr if i+1 >= arr.length

  a, b = arr[i,2]
  if a <= b
    bubble_sort arr, i+1
  else
    arr[i,2] = b, a
    bubble_sort arr, ( i == 0 ? 1 : i-1 )
  end
end

puts
puts "Bubble sort..."
puts "\t" + bubble_sort(arr).join(', ')

#!/usr/bin/env ruby

BOTTLES = 9999

class String
  def present?
    self && length > 0
  end
end

def english_number number
  if number < 0
    return 'Please enter a number that isn\'t negative.'
  end

  if number == 0
    return 'zero'
  end

  num_string = ''

  lookup = { 0 => '' }
  %w[ one two three four five six seven eight nine ten
      eleven twelve thirteen fourteen fifteen sixteen seventeen
      eighteen nineteen ].each_with_index do |e, i|
    lookup[i+1] = e
  end

  prefixes = {
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety',
  }

  suffixes = {
    100 => 'hundred',
    1_000 => 'thousand',
    1_000_000 => 'million',
    1_000_000_000 => 'billion',
    1_000_000_000_000 => 'trillion',
  }

  suffixes.sort.reverse.each do |num, suffix|
    if ( qsuffix = number / num ) > 0
      num_string += " " if num_string.present?
      num_string += english_number(qsuffix) + " #{suffix}"
    end
    number %= num
  end

  prefix_string = ''
  prefixes.sort.reverse.each do |num, prefix|
    if number >= num
      prefix_string = prefix + " "
      number %= num
    end
  end

  if lookup[number]
    if lookup[number].present? && num_string.present?
      num_string += " and" 
    end
    num_string += " " + prefix_string + lookup[number]
  end

  num_string.strip
end

def p i
  word_i = i.is_a?(Fixnum) ? english_number(i) : i
  "#{word_i} bottle" + ( i == 1 ? '' : 's' )
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

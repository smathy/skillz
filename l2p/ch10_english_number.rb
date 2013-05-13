#!/usr/bin/env ruby

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

puts english_number( 0)
puts english_number( 9)
puts english_number( 10)
puts english_number( 11)
puts english_number( 17)
puts english_number( 32)
puts english_number( 88)
puts english_number( 99)
puts english_number(100)
puts english_number(101)
puts english_number(234)
puts english_number(3211)
puts english_number(17240)
puts english_number(999999)
puts english_number(1000000000000)

#!/usr/bin/env ruby

ROMANS = {
  1 => 'I',
  5 => 'V',
  10 => 'X',
  50 => 'L',
  100 => 'C',
  500 => 'D',
  1000 => 'M'
}

def romanize i
  final = ''
  ROMANS.keys.sort.reverse.each do |divisor|
    final += ROMANS[divisor] * ( i / divisor )
    i %= divisor
  end
  final
end


puts romanize ARGV[0].to_i

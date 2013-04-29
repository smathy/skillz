#!/usr/bin/env ruby

ROMANS = {
  1 => 'I',
  4 => 'IV',
  5 => 'V',
  9 => 'IX',
  10 => 'X',
  40 => 'XL',
  50 => 'L',
  90 => 'XC',
  100 => 'C',
  400 => 'CD',
  500 => 'D',
  900 => 'CM',
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

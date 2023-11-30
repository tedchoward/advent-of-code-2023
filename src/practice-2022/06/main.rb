require_relative './lib'

raw_input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))

puts "Part 1: #{calculate_part_1(raw_input)}"
puts "Part 2: #{calculate_part_2(raw_input)}"

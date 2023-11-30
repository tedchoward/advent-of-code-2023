require_relative './lib'

input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
input = parse_input(input)

puts "Part 1: #{calculate_part_1(input)}"
puts "Part 2: #{calculate_part_2(input)}"

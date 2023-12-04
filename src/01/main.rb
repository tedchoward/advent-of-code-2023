require_relative './lib'

raw_input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))

input = parse_input(raw_input)
puts "Part 1: #{calculate_part_1(input)}"
puts "Part 2: #{calculate_part_2(input)}" # 54702 too low

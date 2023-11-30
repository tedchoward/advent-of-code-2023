require_relative './lib'

input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
input = parse_input(input)

puts "Part 1: #{find_most_calories(input)}"
puts "Part 2: #{find_top_three(input)}"

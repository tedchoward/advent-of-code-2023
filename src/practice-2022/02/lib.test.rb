require_relative './lib'

raw_input = "A Y
B X
C Z
"

input = parse_input(raw_input)

puts "Testing Part 1..."
expected = 15
actual = calculate_part_1(input)
if expected == actual
  puts "SUCCESS!"
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

puts
puts

puts "Testing Part 2..."
expected = 12
actual = calculate_part_2(input)
if expected == actual
  puts "SUCCESS!"
else
  puts "FAILED: expected #{expected}, was #{actual}"
end
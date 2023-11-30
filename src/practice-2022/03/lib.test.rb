require_relative './lib'

raw_input = "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"

input = parse_input(raw_input)

puts "Testing Part 1..."
expected = 157
actual = calculate_part_1(input)
if expected == actual
  puts "SUCCESS!"
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

puts
puts

puts "Testing Part 2..."
expected = 70
actual = calculate_part_2(input)
if expected == actual
  puts "SUCCESS!"
else
  puts "FAILED: expected #{expected}, was #{actual}"
end
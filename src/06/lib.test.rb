require_relative './lib'

raw_input =
  'Time:      7  15   30
Distance:  9  40  200'

puts 'Testing Part 1...'
input = parse_input(raw_input)
expected = 288
actual = calculate_part_1(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

puts
puts

# raw_input = ''

puts 'Testing Part 2...'
# input = parse_input(raw_input)
expected = 71_503
actual = calculate_part_2(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

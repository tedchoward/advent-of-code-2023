require_relative './lib'

raw_input =
  '1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet'

puts 'Testing Part 1...'
input = parse_input(raw_input)
expected = 142
actual = calculate_part_1(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

puts
puts

raw_input =
  'two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen'

puts 'Testing Part 2...'
input = parse_input(raw_input)
expected = 281
actual = calculate_part_2(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

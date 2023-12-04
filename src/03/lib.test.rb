require_relative './lib'

raw_input =
  '467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..'

puts 'Testing Part 1...'
input = parse_input(raw_input)
expected = 4361
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
expected = 467_835
actual = calculate_part_2(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

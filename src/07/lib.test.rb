require_relative './lib'

raw_input =
  '32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483'

puts 'Testing Part 1...'
input = parse_input(raw_input)
expected = 6440
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
expected = 5905
actual = calculate_part_2(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

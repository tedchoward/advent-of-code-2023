require_relative './lib'

raw_input =
  '    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2'

input = parse_input(raw_input)

puts 'Testing Part 1...'
expected = 'CMZ'
actual = calculate_part_1(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

puts
puts

puts 'Testing Part 2...'
input = parse_input(raw_input)
expected = 'MCD'
actual = calculate_part_2(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

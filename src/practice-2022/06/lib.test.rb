require_relative './lib'

raw_input = 'mjqjpqmgbljsphdztnvjfqwrcgsmlb'

puts 'Testing Part 1...'
expected = 7
actual = calculate_part_1(raw_input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

puts
puts

puts 'Testing Part 2...'
expected = 19
actual = calculate_part_2(raw_input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

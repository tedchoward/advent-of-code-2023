require_relative './lib'

input = parse_input("1000
2000
3000

4000

5000
6000

7000
8000
9000

10000")

puts "Testing Part 1..."
expected = 24000
actual = find_most_calories(input)
if expected == actual
  puts "SUCCESS!"
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

puts
puts

puts "Testing Part 2..."
expected = 45000
actual = find_top_three(input)
if expected == actual
  puts "SUCCESS!"
else
  puts "FAILED: expected #{expected}, was #{actual}"
end
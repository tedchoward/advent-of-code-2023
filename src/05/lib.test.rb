require_relative './lib'

raw_input =
  'seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4'

puts 'Testing Part 1...'
input = parse_input(raw_input)
expected = 35
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
expected = 46
actual = calculate_part_2(input)
if expected == actual
  puts 'SUCCESS!'
else
  puts "FAILED: expected #{expected}, was #{actual}"
end

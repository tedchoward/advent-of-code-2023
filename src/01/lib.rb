def parse_input(raw_input)
  raw_input.split(/\n/)
end

def calculate_part_1(input)
  input
    .map do |line|
      digits = line.scan(/\d/)
      "#{digits.first}#{digits.last}".to_i
    end
    .sum
end

DIGIT_MAP = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

def calculate_part_2(input)
  input
    .map do |line|
      digits =
        line.scan(
          /(?=(\d|one|two|three|four|five|six|seven|eight|nine))/
        ).flatten
      "#{DIGIT_MAP[digits.first]}#{DIGIT_MAP[digits.last]}".to_i
    end
    .sum
end

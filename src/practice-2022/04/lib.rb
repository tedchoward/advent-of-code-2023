def parse_input(raw_input)
  raw_input
    .split(/\n/)
    .map { |l| l.split(/,/).map { |s| s.split('-').map { |n| n.to_i } } }
end

def calculate_part_1(input)
  input
    .map do |pair|
      first, second = pair

      if first[0] >= second[0] and first[1] <= second[1]
        1
      elsif second[0] >= first[0] and second[1] <= first[1]
        1
      else
        0
      end
    end
    .sum
end

def calculate_part_2(input)
  input
    .map do |pair|
      first, second = pair
      if second[0] > first[1] or first[0] > second[1]
        0
      else
        1
      end
    end
    .sum
end

def calculate_part_1(input)
  (4...input.size).each do |i|
    return i if input[i - 4, 4].split('').uniq.size == 4
  end
end

def calculate_part_2(input)
  (14...input.size).each do |i|
    return i if input[i - 14, 14].split('').uniq.size == 14
  end
end

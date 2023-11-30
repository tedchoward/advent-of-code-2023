def parse_input(raw_input)
  raw_input.split(/\n/)
end

def get_priority(item)
  if /[[:upper:]]/.match(item)
    item.ord - 38
  else
    item.ord - 96
  end
end

def calculate_part_1(input)
  input.map do |rucksack|
    compartment_size = rucksack.size / 2
    compartment_1 = rucksack.slice(0, compartment_size).split('').to_set
    compartment_2 = rucksack.slice(compartment_size, rucksack.size).split('').to_set
    get_priority((compartment_1 & compartment_2).first)
  end.sum
end

def calculate_part_2(input)
  input.each_slice(3).map do |group|
    get_priority(group.map { |r| r.split('').to_set }.reduce(:&).first)
  end.sum
end
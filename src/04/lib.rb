def parse_input(raw_input)
  raw_input
    .split(/\n/)
    .map do |card|
      match_data =
        /^Card\s+\d+:(?<winning>(\s+\d+)*) \|(?<ours>(\s+\d+)*)$/.match(card)
      [
        match_data[:winning].strip.split(/\s+/).map { |n| n.to_i }.to_set,
        match_data[:ours].strip.split(/\s+/).map { |n| n.to_i }.to_set
      ]
    end
end

def calculate_part_1(input)
  input
    .map { |card| (card[0] & card[1]).reduce(1) { |val, _| val * 2 } / 2 }
    .sum
end

def calculate_part_2(input)
  total = input.size
  extras = []
  input.each do |card|
    new_cards_won = (card[0] & card[1]).size
    extra_instances = extras.shift || 0

    (0...new_cards_won).each do |c|
      if c >= extras.size
        extras << (1 + extra_instances)
      else
        extras[c] += (1 + extra_instances)
      end
    end

    new_cards_won += (new_cards_won * extra_instances)

    total += new_cards_won
  end

  total
end

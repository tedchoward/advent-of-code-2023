FIVE_OF_A_KIND = 6
FOUR_OF_A_KIND = 5
FULL_HOUSE = 4
THREE_OF_A_KIND = 3
TWO_PAIR = 2
ONE_PAIR = 1
HIGH_CARD = 0

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    @counts =
      cards
        .split('')
        .reduce(Hash.new) do |h, c|
          h[c] = h.has_key?(c) ? h[c] + 1 : 1
          h
        end
  end

  def type
    if @counts.has_value?(5)
      FIVE_OF_A_KIND
    elsif @counts.has_value?(4)
      FOUR_OF_A_KIND
    elsif @counts.has_value?(3) and @counts.has_value?(2)
      FULL_HOUSE
    elsif @counts.has_value?(3)
      THREE_OF_A_KIND
    elsif @counts.values.filter { |c| c == 2 }.size == 2
      TWO_PAIR
    elsif @counts.has_value?(2)
      ONE_PAIR
    else
      HIGH_CARD
    end
  end

  def type_with_jokers
    counts = @counts.clone
    return type unless counts.has_key?('J')

    joker_count = counts.delete('J')
    if counts.has_value?(5) or counts.has_value?(5 - joker_count) or
         joker_count == 5
      FIVE_OF_A_KIND
    elsif counts.has_value?(4) or counts.has_value?(4 - joker_count)
      FOUR_OF_A_KIND
    elsif counts.has_value?(3) and counts.has_value?(2)
      FULL_HOUSE
    elsif counts.values.filter { |c| c == 2 }.size == 2
      if joker_count == 1
        FULL_HOUSE
      else
        TWO_PAIR
      end
    elsif counts.has_value?(3) or counts.has_value?(3 - joker_count)
      THREE_OF_A_KIND
    elsif counts.has_value?(2) or counts.has_value?(2 - joker_count)
      ONE_PAIR
    else
      HIGH_CARD
    end
  end

  def inspect
    "Hand - cards: #{@cards}, type: #{type}, type_with_jokers: #{type_with_jokers}"
  end
end

def parse_input(raw_input)
  raw_input
    .split(/\n/)
    .map do |row|
      cards, bid = row.split(/\s+/)
      [Hand.new(cards), bid.to_i]
    end
end

def calculate_part_1(input)
  total_winnings = 0

  input
    .sort do |a, b|
      if a[0].type > b[0].type
        1
      elsif b[0].type > a[0].type
        -1
      else
        a_cards =
          a[0]
            .cards
            .gsub(/A/, 'E')
            .gsub(/K/, 'D')
            .gsub(/Q/, 'C')
            .gsub(/J/, 'B')
            .gsub(/T/, 'A')
        b_cards =
          b[0]
            .cards
            .gsub(/A/, 'E')
            .gsub(/K/, 'D')
            .gsub(/Q/, 'C')
            .gsub(/J/, 'B')
            .gsub(/T/, 'A')
        a_cards > b_cards ? 1 : -1
      end
    end
    .each_with_index do |row, i|
      _, bid = row
      rank = i + 1
      total_winnings += (rank * bid)
    end

  total_winnings
end

def calculate_part_2(input)
  total_winnings = 0

  input
    .sort do |a, b|
      if a[0].type_with_jokers > b[0].type_with_jokers
        1
      elsif b[0].type_with_jokers > a[0].type_with_jokers
        -1
      else
        a_cards =
          a[0]
            .cards
            .gsub(/A/, 'E')
            .gsub(/K/, 'D')
            .gsub(/Q/, 'C')
            .gsub(/J/, '0')
            .gsub(/T/, 'A')
        b_cards =
          b[0]
            .cards
            .gsub(/A/, 'E')
            .gsub(/K/, 'D')
            .gsub(/Q/, 'C')
            .gsub(/J/, '0')
            .gsub(/T/, 'A')
        a_cards > b_cards ? 1 : -1
      end
    end
    .each_with_index do |row, i|
      _, bid = row
      rank = i + 1
      total_winnings += (rank * bid)
    end

  total_winnings
end

def parse_input(raw_input)
  raw_input
    .split(/\n/)
    .map do |line|
      game_id, stats = line.split(/:/)
      game_id = /(\d+)/.match(game_id)[1].to_i

      game_stats =
        stats
          .strip
          .split(/;/)
          .map do |cube_set|
            cube_set
              .split(/,/)
              .reduce(Hash.new) do |hash, c|
                count, color = c.strip.split(/ /)
                hash[color] = count.to_i
                hash
              end
          end

      { game_id: game_id, game_stats: game_stats }
    end
end

MAX_VALUES = { 'red' => 12, 'green' => 13, 'blue' => 14 }

def calculate_part_1(input)
  input
    .filter do |game|
      stats = game[:game_stats]
      stats.all? do |cube_set|
        cube_set.all? { |color, count| MAX_VALUES[color] >= count }
      end
    end
    .map { |game| game[:game_id] }
    .sum
end

def calculate_part_2(input)
  input
    .map do |game|
      max_values = { 'red' => 0, 'green' => 0, 'blue' => 0 }
      stats = game[:game_stats]
      stats.each do |cube_set|
        cube_set.each do |color, count|
          max_values[color] = count if count > max_values[color]
        end
      end

      max_values.values.reduce(:*)
    end
    .sum
end

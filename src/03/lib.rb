def parse_input(raw_input)
  raw_input.split /\n/
end

def digit_touches_symbol?(rows, x, y)
  num_rows = rows.size
  num_cols = rows[0].size

  # check cell to the left
  return true if /[^.0-9]/.match? rows[y][x - 1]

  # check cell on top
  return true if y > 0 and /[^.0-9]/.match?(rows[y - 1][x])

  # check cell to the right
  return true if x + 1 < num_cols and /[^.0-9]/.match?(rows[y][x + 1])

  # check cell on bottom
  return true if y + 1 < num_rows and /[^.0-9]/.match?(rows[y + 1][x])

  # check top-left
  return true if x > 0 and y > 0 and /[^.0-9]/.match?(rows[y - 1][x - 1])

  # check top-right
  if x + 1 < num_cols and y > 0 and /[^.0-9]/.match?(rows[y - 1][x + 1])
    return true
  end

  # check bottom-left
  if x > 0 and y + 1 < num_rows and /[^.0-9]/.match?(rows[y + 1][x - 1])
    return true
  end

  # check bottom-right
  if x + 1 < num_cols and y + 1 < num_rows and
       /[^.0-9]/.match?(rows[y + 1][x + 1])
    return true
  end

  false
end

SchematicSymbol = Struct.new(:name, :x, :y)

def symbols_touching_digit(rows, x, y)
  num_rows = rows.size
  num_cols = rows[0].size
  cell = rows[y][x]
  symbols = []

  # check cell to the left
  if /[^.0-9]/.match? rows[y][x - 1]
    symbols << SchematicSymbol.new(rows[y][x - 1], x - 1, y)
  end

  # check cell on top
  if y > 0 and /[^.0-9]/.match?(rows[y - 1][x])
    symbols << SchematicSymbol.new(rows[y - 1][x], x, y - 1)
  end

  # check cell to the right
  if x + 1 < num_cols and /[^.0-9]/.match?(rows[y][x + 1])
    symbols << SchematicSymbol.new(rows[y][x + 1], x + 1, y)
  end

  # check cell on bottom
  if y + 1 < num_rows and /[^.0-9]/.match?(rows[y + 1][x])
    symbols << SchematicSymbol.new(rows[y + 1][x], x, y + 1)
  end

  # check top-left
  if x > 0 and y > 0 and /[^.0-9]/.match?(rows[y - 1][x - 1])
    symbols << SchematicSymbol.new(rows[y - 1][x - 1], x - 1, y - 1)
  end

  # check top-right
  if x + 1 < num_cols and y > 0 and /[^.0-9]/.match?(rows[y - 1][x + 1])
    symbols << SchematicSymbol.new(rows[y - 1][x + 1], x + 1, y - 1)
  end

  # check bottom-left
  if x > 0 and y + 1 < num_rows and /[^.0-9]/.match?(rows[y + 1][x - 1])
    symbols << SchematicSymbol.new(rows[y + 1][x - 1], x - 1, y + 1)
  end

  # check bottom-right
  if x + 1 < num_cols and y + 1 < num_rows and
       /[^.0-9]/.match?(rows[y + 1][x + 1])
    symbols << SchematicSymbol.new(rows[y + 1][x + 1], x + 1, y + 1)
  end

  symbols
end

def calculate_part_1(rows)
  state = :initial
  part_numbers = []
  part_number_string = ''
  num_rows = rows.size
  (0...num_rows).each do |y|
    row = rows[y]
    num_cols = row.size
    (0...num_cols).each do |x|
      cell = row[x]
      if /\d/.match? cell
        part_number_string << row[x]
        state = :valid_number if digit_touches_symbol?(rows, x, y)
      else
        if part_number_string.size > 0 and state == :valid_number
          part_numbers << part_number_string.to_i
        end

        state = :initial
        part_number_string = ''
      end
    end
  end

  part_numbers.sum
end

def calculate_part_2(rows)
  state = :initial
  symbols_to_part_numbers = Hash.new
  part_number_string = ''
  symbols = Set.new

  num_rows = rows.size
  (0...num_rows).each do |y|
    row = rows[y]
    num_cols = row.size
    (0...num_cols).each do |x|
      cell = row[x]
      if /\d/.match? cell
        part_number_string << row[x]
        adjacent_symbols = symbols_touching_digit(rows, x, y)
        unless adjacent_symbols.empty?
          state = :valid_number
          symbols.merge(adjacent_symbols)
        end
      else
        if part_number_string.size > 0 and state == :valid_number
          symbols.each do |sym|
            mapping = symbols_to_part_numbers[sym]
            if mapping.nil?
              mapping = []
              symbols_to_part_numbers[sym] = mapping
            end

            mapping << part_number_string.to_i
          end

          symbols = Set.new
        end

        state = :initial
        part_number_string = ''
      end
    end
  end

  symbols_to_part_numbers
    .filter do |symbol, part_numbers|
      symbol.name == '*' and part_numbers.size == 2
    end
    .values
    .map { |part_numbers| part_numbers.reduce(:*) }
    .sum
end

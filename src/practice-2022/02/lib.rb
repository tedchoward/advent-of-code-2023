def parse_input(raw_input)
  raw_input.split(/\n/)
end

ROCK = 1
PAPER = 2
SCISSORS = 3

LOSE = 0
DRAW = 3
WIN = 6

SCORE_MATRIX = {
  'A X': ROCK + DRAW,
  'B X': ROCK + LOSE,
  'C X': ROCK + WIN,

  'A Y': PAPER + WIN,
  'B Y': PAPER + DRAW,
  'C Y': PAPER + LOSE,

  'A Z': SCISSORS + LOSE,
  'B Z': SCISSORS + WIN,
  'C Z': SCISSORS + DRAW
}

def calculate_part_1(input)
  input.map { |g| SCORE_MATRIX[g.to_sym] }.sum
end

# X = lose, Y = draw, X = win
SCORE_MATRIX_2 = {
  # Rock
  'A X': SCISSORS + LOSE,
  'A Y': ROCK + DRAW,
  'A Z': PAPER + WIN,

  # Paper
  'B X': ROCK + LOSE,
  'B Y': PAPER + DRAW,
  'B Z': SCISSORS + WIN,

  # Scissors
  'C X': PAPER + LOSE,
  'C Y': SCISSORS + DRAW,
  'C Z': ROCK + WIN
}

def calculate_part_2(input)
  input.map { |g| SCORE_MATRIX_2[g.to_sym] }.sum
end
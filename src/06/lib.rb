def parse_input(raw_input)
  raw_input
    .split(/\n/)
    .map { |row| row.split(/\W+/).map { |n| n.to_i }.drop(1) }
end

def simulate_races(total_time, record_distance)
  (0...total_time)
    .map { |speed| speed * (total_time - speed) }
    .filter { |distance| distance > record_distance }
    .size
end

def calculate_part_1(input)
  times, distances = input

  (0...times.size).map { |x| simulate_races(times[x], distances[x]) }.reduce(:*)
end

def calculate_part_2(input)
  times, distances = input
  total_time = times.join('').to_i
  record_distance = distances.join('').to_i

  simulate_races(total_time, record_distance)
end

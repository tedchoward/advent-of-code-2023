def parse_input(input)
  input.split(/\n\n/).map { |s| s.split(/\n/).map { |x| x.to_i } }
end

def find_most_calories(input)
  input.map { |a| a.sum }.max
end

def find_top_three(input)
  input.map { |ary| ary.sum }.sort { |a, b| b - a }.take(3).sum
end

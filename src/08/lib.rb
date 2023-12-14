Node = Struct.new(:name, :left, :right)

class Instructions
  def initialize(inst_str)
    @instructions = inst_str.split('')
    @size = @instructions.size
  end

  def each
    @current_index = 0

    loop do
      yield @instructions[@current_index]
      @current_index += 1
      @current_index = 0 if @current_index == @size
    end
  end

  def count_steps(current_node, nodes)
    steps = 0

    each do |instruction|
      next_node =
        case instruction
        when 'L'
          current_node.left
        when 'R'
          current_node.right
        else
          raise 'Hell'
        end

      steps += 1

      break if yield next_node
      current_node = nodes[next_node]
    end

    steps
  end
end

def parse_input(raw_input)
  l_r_instructions, node_network = raw_input.split(/\n\n/)

  instructions = Instructions.new(l_r_instructions)

  nodes =
    node_network
      .split(/\n/)
      .reduce(Hash.new) do |h, row|
        _, name, left, right = /(\w+) = \((\w+), (\w+)\)/.match(row).to_a
        h[name] = Node.new(name, left, right)
        h
      end

  [instructions, nodes]
end

def calculate_part_1(input)
  instructions, nodes = input

  current_node = nodes['AAA']

  instructions.count_steps(current_node, nodes) do |next_node|
    next_node == 'ZZZ'
  end
end

def calculate_part_2(input)
  instructions, nodes = input

  current_nodes = nodes.filter { |key, _| key.end_with?('A') }.values

  current_nodes
    .map do |current_node|
      instructions.count_steps(current_node, nodes) do |next_node|
        next_node.end_with?('Z')
      end
    end
    .reduce(1, :lcm)
end

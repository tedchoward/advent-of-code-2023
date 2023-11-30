def parse_input(raw_input)
  stacks_input, instructions = raw_input.split(/\n\n/)

  stacks = parse_stacks(stacks_input)
  instructions = parse_instructions(instructions)

  [stacks, instructions]
end

def parse_stacks(stacks_input)
  stacks_input = stacks_input.split(/\n/)
  num_stacks = (stacks_input[0].size + 1) / 4
  stacks = Array.new(num_stacks) { [] }

  stacks_input.each do |line|
    line
      .split('')
      .each_with_index do |ch, i|
        if /[A-Z]/.match(ch)
          stack_idx = i / 4
          stacks[stack_idx] << ch
        end
      end
  end

  stacks
end

Instruction = Struct.new(:count, :src, :dest)

def parse_instructions(input)
  input
    .split(/\n/)
    .map do |instr|
      m = /move (\d+) from (\d+) to (\d+)/.match(instr)
      Instruction.new(m[1].to_i, m[2].to_i, m[3].to_i)
    end
end

def calculate_part_1(input)
  stacks, instructions = input

  instructions.each do |instr|
    instr.count.times do
      item = stacks[instr.src - 1].shift
      stacks[instr.dest - 1].prepend item
    end
  end

  stacks.map { |s| s.first }.join('')
end

def calculate_part_2(input)
  stacks, instructions = input

  instructions.each do |instr|
    items = stacks[instr.src - 1].shift(instr.count)
    stacks[instr.dest - 1].prepend(items).flatten!
  end

  stacks.map { |s| s.first }.join('')
end

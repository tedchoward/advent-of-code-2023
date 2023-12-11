class SourceToDestMap
  def initialize(dest_start, source_start, length)
    @dest_start = dest_start
    @source_start = source_start
    @length = length
  end

  def map_source_to_dest(source)
    if @dest_start > @source_start
      (@dest_start - @source_start) + source
    else
      source - (@source_start - @dest_start)
    end
  end

  def source_in_map?(source)
    source >= @source_start and source <= source_end
  end

  def map_source_to_dest_range(target_start, target_length)
    target_end = target_start + target_length - 1
    if (target_start < @source_start and target_end >= @source_start) or
         (target_start >= @source_start and target_start <= source_end)
      prefix =
        if target_start < @source_start
          [target_start, @source_start - target_start]
        else
          nil
        end

      suffix =
        if target_end > source_end
          [source_end + 1, target_end - source_end]
        else
          nil
        end

      # match
      new_start = [@source_start, target_start].max
      new_end = [source_end, target_end].min
      new_length = (new_end - new_start) + 1

      [prefix, [map_source_to_dest(new_start), new_length], suffix]
    else
      nil
    end
  end

  private

  def source_end
    @source_start + @length - 1
  end
end

def parse_input(raw_input)
  collections = raw_input.split(/\n\n/)
  seeds =
    /^seeds:((\s+\d+)*)$/.match(collections[0])[1]
      .strip
      .split(/\s+/)
      .map { |n| n.to_i }

  maps =
    collections
      .drop(1)
      .map do |collection|
        collection
          .split(/\n/)
          .drop(1)
          .map do |m|
            dest_start, source_start, length = m.split(/\s+/).map { |n| n.to_i }
            SourceToDestMap.new(dest_start, source_start, length)
          end
      end

  [seeds, maps]
end

def calculate_part_1(input)
  seeds, maps = input

  seeds
    .map do |seed|
      current = seed
      maps.each do |map_set|
        m = map_set.filter { |m| m.source_in_map?(current) }.first
        current = m.map_source_to_dest(current) unless m.nil?
      end
      current
    end
    .min
end

def calculate_part_2(input)
  seeds, maps = input
  current_seeds = seeds.each_slice(2).to_a

  maps.each do |map_set|
    current_seeds =
      current_seeds.map do |seed_range|
        seed_start, seed_length = seed_range
        tmp = nil

        map_set.each do |m|
          prefix, range, suffix =
            m.map_source_to_dest_range(seed_start, seed_length)

          current_seeds << prefix unless prefix.nil?
          current_seeds << suffix unless suffix.nil?

          unless range.nil?
            tmp = range
            break
          end
        end

        tmp.nil? ? seed_range : tmp
      end
  end

  current_seeds.map { |s| s.first }.min
end

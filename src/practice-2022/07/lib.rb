module Day07
  class File
    attr_reader :name, :size

    def initialize(name, size)
      @name = name
      @size = size
    end
  end

  class Directory < File
    attr_accessor :parent

    def initialize(name, parent = nil)
      super(name, 0)
      @files = []
      @dirs = {}
      @parent = parent
    end

    def size
      @files.map(&:size).sum
    end

    def <<(item)
      @files << item
      @dirs[item.name] = item if item.class == Directory
    end

    def get_subdirectory(name)
      subdir = @dirs[name]
      subdir = Directory.new(name) if subdir.nil?
      self << subdir
      subdir.parent = self
      subdir
    end

    def each(&block)
      @files.each do |file|
        yield file
        file.each(&block) if file.class == Directory
      end
    end
  end
end

def parse_input(raw_input)
  root_dir = Day07::Directory.new('/')
  current_dir = root_dir
  raw_input
    .split(/\n/)
    .each do |line|
      if line[0] == '$'
        if line[2, 2] == 'cd'
          # change directory
          dir_name = line.slice(5..)
          # puts "CD #{dir_name}"
          if dir_name == '/'
            current_dir = root_dir
          elsif dir_name == '..'
            current_dir = current_dir.parent
          else
            current_dir = current_dir.get_subdirectory(dir_name)
          end
        else
          # ls, do nothing
        end
      else
        # line must be a file to add to current dir
        size, name = line.split(' ')
        current_dir << Day07::File.new(name, size.to_i) if size != 'dir'
      end
    end

  root_dir
end

def calculate_part_1(root_dir)
  sum = 0
  root_dir.each do |f|
    sum += f.size if f.class == Day07::Directory and f.size < 100_000
  end

  sum
end

def calculate_part_2(root_dir)
  total_disk_space = 70_000_000
  target_free_space = 30_000_000
  current_free_space = total_disk_space - root_dir.size
  free_space_needed = target_free_space - current_free_space
  directory_size_to_delete = total_disk_space

  root_dir.each do |f|
    if f.class == Day07::Directory and f.size >= free_space_needed and
         f.size < directory_size_to_delete
      directory_size_to_delete = f.size
    end
  end

  directory_size_to_delete
end

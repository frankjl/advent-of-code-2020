class XmasDecoder
  attr_accessor :size
  def initialize(buffer)
    @size = buffer
  end

  def load(input)
    @lines = input.split(/\n/).map(&:to_i)
  end

  def detect_bad_byte
    index = 0
    until index + @size == @lines.size
      previous = @lines.slice(index, @size)
      candidate = @lines[index + @size]
      return candidate unless is_valid?(previous, candidate)
      index += 1
    end
  end

  def find_weakness(sum)
    # This one is weird... you'll need to vary the index of the
    # start of the search, as well as the size of search array.

    index = 0

    until index == @lines.size
      size = 1
      
      until size == @lines.size - index
        search_space = @lines.slice(index, size)
        if sum == search_space.sum
          # Bingo!
          return [search_space.min, search_space.max].sum
        end
        size += 1
      end
      index += 1
    end
  end

  private

  def is_valid?(list, candidate)
    # Candidate must be any of the previous
    # numbers added together
    (0..@size - 1).each do |i|
      clone = list.clone
      first = clone.slice!(i, 1).first
      return true if clone.include?(candidate - first)
    end
    false
  end
end

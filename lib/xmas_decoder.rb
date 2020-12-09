class XmasDecoder
  def initialize(buffer)
    @size = buffer
  end

  def load(input)
    @lines = input.split(/\n/).map(&:to_i)
  end

  def detect_bad_byte
    (0..@lines.size - @size).each do |index|
      previous = @lines.slice(index, @size)
      candidate = @lines[index + @size]
      return candidate unless is_valid?(previous, candidate)
    end
  end

  def find_weakness(sum)
    # This one is weird... you'll need to vary the index of the
    # start of the search, as well as the size of search array.
    (0..@lines.size).each do |index|
      (1..@lines.size - index).each do |size|
        search_space = @lines.slice(index, size)
        return [search_space.min, search_space.max].sum if sum == search_space.sum
      end
    end
  end

  private

  def is_valid?(list, candidate)
    # Candidate must be any 2 of the previous
    # numbers added together
    (0..@size - 1).each do |i|
      clone = list.clone
      first = clone.slice!(i, 1).first
      return true if clone.include?(candidate - first)
    end
    false
  end
end

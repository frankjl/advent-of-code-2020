class Seat
  attr_accessor :row, :column, :id

  def initialize(input)
    input.strip!
    @row = row_number(input)
    @column = column_number(input)
    @id = (@row * 8) + @column
  end

  private

  def row_number(line)
    parse(line[0..6], "F", "B")
  end

  def column_number(line)
    parse(line[7..9], "L", "R")
  end

  def parse(line, low, high)
    # Convert this line into a binary number using
    # the low and high characters
    binary = line.split("").map { |char|
      char == high ? 1 : 0
    }
    # Now back to decimal...
    binary.join("").to_i(2).to_s(10).to_i
  end
end

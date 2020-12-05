class SeatLayout
  attr_accessor :seats

  def initialize
    @seats = []
  end

  def load(input)
    input.split(/\n/).each do |boarding_pass|
      @seats << Seat.new(boarding_pass)
    end
  end

  def find_empty
    # Find the minimum and maximum seat values
    minimum = @seats.min_by(&:id).id
    maximum = @seats.max_by(&:id).id

    # Create an array of all possible seats between them...
    range = (minimum..maximum).to_a

    # And remove any seats we've already found
    range - @seats.map(&:id)
  end
end

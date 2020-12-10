class ExpenseReport
  def load(input)
    @lines = input.split(/\n/).map(&:to_i)
  end

  def find_vector(sum, n = 2)
    if n == 1
      return sum if @lines.include?(sum)
    else
      (0..@lines.size - 1).each do |index|
        value = @lines[index]
        vector = find_vector(sum - value, n - 1)
        return value * vector if vector
      end
      nil
    end
  end
end

class PasswordPolicy
  def load(input)
    @lines = input.split(/\n/)
  end

  def validate
    @lines.find_all do |line|
      (min, max, char, password) = line.split(/[-\s:]+/)
      [password[min.to_i - 1], password[max.to_i - 1]].count(char) == 1
    end
  end
end

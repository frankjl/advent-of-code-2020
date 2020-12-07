class DeclarationForm
  def load(input)
    @lines = input.split(/\n/)
  end

  def sum
    sum = 0
    until @lines.empty?
      group = next_group()
      size = group.split("\n").size

      unique = group.gsub(/\s+/, "").split("").uniq

      unique.each do |character|
        sum +=1 if group.count(character) == size
      end
    end
    sum
  end

  private

  def next_group
    answers = []
    while !@lines.empty? && !@lines.first.empty?
      answers << @lines.shift
    end
    @lines.shift unless @lines.empty?
    answers.join("\n")
  end
end

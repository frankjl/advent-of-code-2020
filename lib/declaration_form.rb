class DeclarationForm
  def load(input)
    @lines = input.split(/\n/)
    @groups ||= []
    until @lines.empty?
      @groups << next_group
    end
  end

  def sum
    @groups.sum(&:count)
  end

  class Group
    def initialize
      @members = []
    end

    def size
      @members.size
    end

    def add(line)
      @members << line
    end

    def count
      letters = @members.flatten.join("")
      letters.split("").uniq.count { |character|
        # If every member had this answer...
        letters.count(character) == size
      }
    end
  end

  private

  def next_group
    group = Group.new
    until @lines.empty? || @lines.first.empty?
      group.add(@lines.shift)
    end
    @lines.shift unless @lines.empty?
    group
  end
end

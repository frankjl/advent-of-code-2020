class LuggageProcessor
  def load(input)
    @rules ||= {}
    input.split(/\n/).each do |line|
      parts = line.split(/[.,\s]+/)
      source = parts.shift(3).join(" ")

      # Dispose of the word "contains"
      parts.shift

      until parts.empty?
        count = parts.shift.to_i
        destination = parts.shift(3).join(" ")
        add_rule(source, destination, count)
      end
    end
  end

  def sum(item)
    @rules[item.to_sym][:links].reduce(0) do |sum, link|
      sum += link[:count] * sum(link[:destination]) if link[:count] > 0
      sum + link[:count]
    end
  end

  def parents(item, list = [])
    sources = @rules.filter { |key|
      @rules[key][:links].any? { |link| link[:count] > 0 && [item.to_s, "other"].include?(link[:destination]) }
    }

    sources.keys.each do |key|
      unless list.include?(key)
        list << key
        parents(key, list)
      end
    end

    list
  end

  private

  def add_rule(source, destination, count)
    key = source.gsub(/\sbags?/, "")
    value = destination.gsub(/\sbags?/, "")
    @rules[key.to_sym] ||= {links: []}
    @rules[key.to_sym][:links] << {
      count: count,
      destination: value
    }
  end
end

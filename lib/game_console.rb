class GameConsole
  attr_accessor :instructions, :value

  def load(input)
    @instructions = input.split(/\n/)
    clear
  end

  def execute_safely
    executed_instructions = []
    until executed_instructions.include?(@index) || @index == @instructions.size
      executed_instructions << @index
      execute_next
    end
    is_completed?
  end

  def is_completed?
    @index == @instructions.size
  end

  def detect_bad_instruction
    index = 0
    possibly_bad_instruction = nil
    
    until execute_safely
      clear
      if !possibly_bad_instruction.nil?
        @instructions[index] = possibly_bad_instruction
      end

      index += 1
      # Find the next possibly_bad_instruction
      relative_index = @instructions[index..-1].find_index { |item|
        (instruction, value) = item.strip.split(/\s/)
        instruction == "jmp" || (instruction == "nop" && value.to_i > 0)
      }
      index += relative_index
      possibly_bad_instruction = @instructions[index]

      # Change it!
      if /jmp/.match(possibly_bad_instruction)
        new_instruction = possibly_bad_instruction.gsub(/jmp/, "nop")
        @instructions[index] = new_instruction
      elsif /nop/.match(possibly_bad_instruction)
        new_instruction = possibly_bad_instruction.gsub(/nop/, "jmp")
        @instructions[index] = new_instruction
      end
    end
  end

  private

  def switch(index)
    instruction = @instructions[index]
    # Change it!
    if /jmp/.match(instruction)
      @instructions[index] = instruction.gsub(/jmp/, "nop")
    elsif /nop/.match(possibly_bad_instruction)
      @instructions[index] = instruction.gsub(/nop/, "jmp")
    end
  end

  def next_instruction
    @instructions[@index]
  end

  def execute_next
    instruction = next_instruction
    (command, value) = instruction.strip.split(/\s+/)
    execute(command, value)
  end

  def execute(command, value)
    case command
    when "acc"
      @value += value.to_i
      @index += 1
    when "jmp"
      @index += value.to_i
    when "nop"
      @index += 1
    else
      raise "Unrecognized command: #{command}"
    end
  end

  def clear
    @index = 0
    @value = 0
  end
end

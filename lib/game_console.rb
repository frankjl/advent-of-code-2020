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
    until execute_safely
      clear
      # Revert the last switched instruction (if applicable)
      switch(index - 1) if index >= 0
      
      # Switch the next instruction
      switch(index)
      index += 1
    end
  end

  private

  def switch(index)
    instruction = @instructions[index]
    # Change it!
    if /jmp/.match(instruction)
      @instructions[index] = instruction.gsub("jmp", "nop")
    elsif /nop/.match(instruction)
      @instructions[index] = instruction.gsub("nop", "jmp")
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

require_relative "../lib/game_console"

describe GameConsole do
  let(:console) { GameConsole.new }
  describe "#load" do
    it "should process the sample input" do
      console.load(File.read("spec/inputs/day-8/sample.txt"))
      value = console.execute_safely
      expect(console.value).to eq 5
      expect(value).to be false
    end
    it "should execute successfully if one instruction is changed" do
      console.load(File.read("spec/inputs/day-8/sample.txt"))
      console.instructions[7] = "nop -4"
      value = console.execute_safely
      expect(console.value).to eq 8
      expect(value).to be true
    end
  end
  describe "#detect_bad_instruction" do
    it "should find the bad instruction" do
      console.load(File.read("spec/inputs/day-8/input.txt"))
      console.detect_bad_instruction
      expect(console.value).to eq 797
    end
  end
end

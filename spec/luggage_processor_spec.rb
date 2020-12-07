require_relative "../lib/luggage_processor"

describe LuggageProcessor do
  it "should load an input" do
    processor = LuggageProcessor.new
    processor.load(File.read("spec/inputs/day-7/sample.txt"))
  end
  it "should find the parents of the sample input" do
    processor = LuggageProcessor.new
    processor.load(File.read("spec/inputs/day-7/sample.txt"))
    parents = processor.parents("shiny gold")
    expect(parents.size).to eq 4
  end
  it "should find the parents of the actual input" do
    processor = LuggageProcessor.new
    processor.load(File.read("spec/inputs/day-7/input.txt"))
    parents = processor.parents("shiny gold")
    expect(parents.size).to eq 287
  end
  it "should find the totel # of bars from the sample" do
    processor = LuggageProcessor.new
    processor.load('shiny gold bags contain 2 dark red bags.
dark red bags contain 2 dark orange bags.
dark orange bags contain 2 dark yellow bags.
dark yellow bags contain 2 dark green bags.
dark green bags contain 2 dark blue bags.
dark blue bags contain 2 dark violet bags.
dark violet bags contain no other bags.')
    sum = processor.sum("shiny gold")
    expect(sum).to eq 126
  end
  it "should find the total # of bags from of the actual input" do
    processor = LuggageProcessor.new
    processor.load(File.read("spec/inputs/day-7/input.txt"))
    sum = processor.sum("shiny gold")
    expect(sum).to eq 48160
  end
end

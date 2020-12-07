require_relative "../lib/declaration_form"

describe DeclarationForm do
  let(:form) {
    DeclarationForm.new
  }

  it "should handle the sample input" do
    input = File.read("spec/inputs/day-6/sample.txt")
    form.load(input)
    expect(form.sum).to eq 6
  end

  it "should handle the real input" do
    input = File.read("spec/inputs/day-6/input.txt")
    form.load(input)
    expect(form.sum).to eq 3288
  end
end

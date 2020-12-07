require_relative "../lib/declaration_form"

describe DeclarationForm do
  let(:form) {
    DeclarationForm.new
  }
  describe "Group" do
    describe "#add" do
      it "should add members" do
        group = DeclarationForm::Group.new
        expect(group.size).to eq 0
        group.add("abc")
        expect(group.size).to eq 1
      end
    end
    describe "#sum" do
      it "should calculate the sum" do
        group = DeclarationForm::Group.new
        group.add("abc")
        expect(group.count).to eq 3
        group.add("a")
        expect(group.count).to eq 1
      end
    end
  end

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

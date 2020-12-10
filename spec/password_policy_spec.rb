require_relative "../lib/password_policy"

describe PasswordPolicy do
  describe "#sample_input" do
    let(:policy) {
      policy = PasswordPolicy.new
      policy.load(File.read("spec/inputs/day-2/sample.txt"))
      policy
    }
    it "should handle the sample input" do
      result = policy.validate
      expect(result.size).to eq 1
    end
  end
  describe "#actual_input" do
    let(:policy) {
      policy = PasswordPolicy.new
      policy.load(File.read("spec/inputs/day-2/input.txt"))
      policy
    }
    it "should handle the actual input" do
      result = policy.validate
      expect(result.size).to eq 729
    end
  end
end

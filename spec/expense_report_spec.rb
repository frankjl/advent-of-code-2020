require_relative "../lib/expense_report"

describe ExpenseReport do
  describe "sample input" do
    let(:report) {
      report = ExpenseReport.new
      report.load(File.read("spec/inputs/day-1/sample.txt"))
      report
    }
    it "should find the product of 2 numbers" do
      result = report.find_vector(2020)
      expect(result).to eq 514579
    end
    it "should find the product of 3 numbers" do
      result = report.find_vector(2020, 3)
      expect(result).to eq 241861950
    end
  end
  describe "#actual_input" do
    let(:report) {
      report = ExpenseReport.new
      report.load(File.read("spec/inputs/day-1/input.txt"))
      report
    }
    it "should find the product of 2 numbers" do
      result = report.find_vector(2020)
      expect(result).to eq 806656
    end
    it "should find the product of 3 numbers" do
      result = report.find_vector(2020, 3)
      expect(result).to eq 230608320
    end
  end
end

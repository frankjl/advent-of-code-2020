require_relative "../lib/seat"

describe Seat do
  describe "#row" do
    it "should calculate the row number correctly" do
      expect(Seat.new("BFFFBBFRRR").row).to eq 70
      expect(Seat.new("FFFBBBFRRR").row).to eq 14
      expect(Seat.new("BBFFBBFRLL").row).to eq 102
    end
  end
  describe "#column" do
    it "should calculate the column number correctly" do
      expect(Seat.new("FBFBBFFRLR").column).to eq 5
      expect(Seat.new("BFFFBBFRRR").column).to eq 7
      expect(Seat.new("FFFBBBFRRR").column).to eq 7
      expect(Seat.new("BBFFBBFRLL").column).to eq 4
    end
  end
  describe "#id" do
    it "should calculate the id correctly" do
      expect(Seat.new("BFFFBBFRRR").id).to eq 567
      expect(Seat.new("FFFBBBFRRR").id).to eq 119
      expect(Seat.new("BBFFBBFRLL").id).to eq 820
    end
  end
end

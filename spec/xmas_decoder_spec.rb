require_relative "../lib/xmas_decoder"

describe XmasDecoder do
  describe "#sample_input" do
    let(:decoder) {
      decoder = XmasDecoder.new(5)
      decoder.load(File.read("spec/inputs/day-9/sample.txt"))
      decoder
    }
    it "should detect the bad byte" do
      result = decoder.detect_bad_byte
      expect(result).to eq 127
    end
    it "should detect the weakness using the bad byte" do
      bad_byte = decoder.detect_bad_byte
      weakness = decoder.find_weakness(bad_byte)
      expect(weakness).to eq 62
    end
  end
  describe "#actual_input" do
    let(:decoder) {
      decoder = XmasDecoder.new(25)
      decoder.load(File.read("spec/inputs/day-9/input.txt"))
      decoder
    }
    it "should detect the bad byte" do
      result = decoder.detect_bad_byte
      expect(result).to eq 177777905
    end
    it "should detect the bad byte" do
      bad_byte = decoder.detect_bad_byte
      weakness = decoder.find_weakness(bad_byte)
      expect(weakness).to eq 23463012
    end
  end
end

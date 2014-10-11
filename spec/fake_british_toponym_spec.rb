require "spec_helper"

describe FakeBritishToponym do

  MANY = 10e3.to_i

  it "should exist" do
    expect(FakeBritishToponym).to be_truthy
  end

  describe "options" do

    describe "modifier" do
      describe "when set to false" do
        it "should never be more than one word or include punctuation" do
          MANY.times do
            toponym = FakeBritishToponym.new(modifier: false)
            expect(toponym).to_not include " "
            expect(toponym).to_not include "-"
            expect(toponym).to_not include "'"
          end
        end
      end

      it "should not contain obvious errors" do
        DOUBLE_CAPITAL_REGEX = /{[A-Z]{2}/
        DOUBLE_NONALPHA_REGEX = /[^[:alpha:]]{2}/

        MANY.times do
          toponym = FakeBritishToponym.new(modifier: true)
          [DOUBLE_CAPITAL_REGEX, DOUBLE_NONALPHA_REGEX].each do |regex|
            expect(toponym).not_to match regex
          end
          [" -", "- ", " '", "' "].each do |bad_char_sequence|
            expect(toponym).not_to include bad_char_sequence
          end
        end
      end
    end

    describe "min_syllables" do
      it "should return words of roughly appropriate length" do
        MANY.times do
          length = rand(10)
          toponym = FakeBritishToponym.new(min_syllables: length)
          expect(toponym.length).to be > length * 2
        end
      end
    end

  end

end

require "spec_helper"

describe FakeBritishToponym do

  MANY = 10e3.to_i

  describe "#initialize" do

    subject { FakeBritishToponym.new }

    it { is_expected.to be_a String }

  end

  describe "#initialize options" do

    describe "modifier" do

      describe "false" do

        subject { Array.new(MANY) { FakeBritishToponym.new(modifier: false) } }

        it "should never be more than one word or include punctuation" do
          subject.each do |toponym|
            expect(toponym).to_not include " "
            expect(toponym).to_not include "-"
            expect(toponym).to_not include "'"
          end
        end

      end

      describe "true" do

        subject { Array.new(MANY) { FakeBritishToponym.new(modifier: true) } }

        it "should not have double capital letters" do
          DOUBLE_CAPITAL_REGEX = /{[A-Z]{2}/
          subject.each do |toponym|
            expect(toponym).not_to match DOUBLE_CAPITAL_REGEX
          end
        end

        it "should not have double punctuation/spaces" do
          DOUBLE_NONALPHA_REGEX = /[^[:alpha:]]{2}/
          subject.each do |toponym|
            expect(toponym).not_to match DOUBLE_NONALPHA_REGEX
          end
        end

        it "should not have invalid character sequences" do
          # little redundant with the nonalpha test
          subject.each do |toponym|
            [" -", "- ", " '", "' "].each do |bad_char_sequence|
              expect(toponym).not_to include bad_char_sequence
            end
          end
        end

      end

    end

    describe "min_syllables" do

      length = rand(10)

      subject { Array.new(MANY) { FakeBritishToponym.new(min_syllables: length) } }

      it "should return words of roughly appropriate length" do
        subject.each do |toponym|
          expect(toponym.length).to be > length * 2
        end
      end

    end

  end

end

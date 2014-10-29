require './gilded_rose.rb'
require "rspec"
require "rspec/its"

describe GildedRose do

  describe "update_quality" do
    let(:described) { described_class.new }

    before do
      described.update_quality
    end

    subject { described.items.find { |i| i.name == fine_cheese } }

    context "when standard items" do

      context "when +5 Dexterity Vest" do
        let (:fine_cheese) { "+5 Dexterity Vest" }

        its(:sell_in) { should eq 9 }
        its(:quality) { should eq 19 }
      end

      context "when Elixir of the Mongoose" do
        let (:fine_cheese) { "Elixir of the Mongoose" }

        its(:sell_in) { should eq 4 }
        its(:quality) { should eq 6 }
      end
    end
  end
end

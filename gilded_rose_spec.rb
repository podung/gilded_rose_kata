require './gilded_rose.rb'
require "rspec"
require "rspec/its"

describe GildedRose do
  let(:dexterity) { Item.new("+5 Dexterity Vest", 10, 20) }
  let(:aged_brie) { Item.new("Aged Brie", 2, 0) }
  let(:elixir)    { Item.new("Elixir of the Mongoose", 5, 7) }
  let(:sulfuras)  { Item.new("Sulfuras, Hand of Ragnaros", 0, 80) }
  let(:backstage) { Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20) }
  let(:conjured)  { Item.new("Conjured Mana Cake", 3, 6) }

  describe "update_quality" do
    let(:described) { described_class.new }

    before do
      described.items = items
    end

    context "when standard items" do
      let(:items) { [ dexterity, elixir ] }

      before do
        described.update_quality
      end

      subject { described.items.find { |i| i.name == fine_cheese } }

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

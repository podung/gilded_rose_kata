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

  describe "calling update_quality" do
    let(:described) { described_class.new }

    before do
      described.items = items
      described.update_quality
    end

    subject { described.items.find { |i| i.name == fine_cheese } }

    context "when standard items" do
      context "with positive sell_in" do
        let(:items) { [ dexterity, elixir ] }

        context "when +5 Dexterity Vest" do
          let (:fine_cheese) { dexterity.name }

          its(:sell_in) { should eq 9 }
          its(:quality) { should eq 19 }
        end

        context "when Elixir of the Mongoose" do
          let (:fine_cheese) { elixir.name }

          its(:sell_in) { should eq 4 }
          its(:quality) { should eq 6 }
        end
      end

      context "with expired sell_in" do
        let(:items) { [ Item.new(name, 0, 10) ] }
        let(:fine_cheese) { name }

        context "its quality degrades twice as fast" do
          context "dexterity" do
            let(:name) { dexterity.name }
            its(:quality) { should eq 8 }
          end

          context "elixir" do
            let(:name) { elixir.name }
            its(:quality) { should eq 8 }
          end
        end
      end

      context "with 0 quality" do
        let(:items) { [ Item.new(name, 10, 0) ] }
        let(:fine_cheese) { name }

        context "its quality never goes below zero" do
          context "dexterity" do
            let(:name) { dexterity.name }
            its(:quality) { should eq 0 }
          end

          context "elixir" do
            let(:name) { elixir.name }
            its(:quality) { should eq 0 }
          end
        end
      end
    end

    context "aged brie" do
      let(:items) { [ aged_brie ] }
      let (:fine_cheese) { aged_brie.name }

      context "increases in quality each day" do
        its(:sell_in) { should eq 1 }
        its(:quality) { should eq 1 }
      end

      context "when already at max quality" do
        let (:items) { [ Item.new(aged_brie.name, 2, 50) ] }
        its(:quality) { should eq 50 }
      end
    end
  end
end

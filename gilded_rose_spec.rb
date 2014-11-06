require_relative './gilded_rose.rb'
require "rspec"
require "rspec/its"

describe GildedRose do
  let(:dexterity) { Dexterity.new(10, 20) }
  let(:elixir)    { Elixer.new(5, 7) }
  let(:conjured)  { Conjured.new(3, 6) }
  let(:aged_brie) { AgedBrie.new(2, 0) }
  let(:sulfuras)  { Sulfuras.new(0, 80) }
  let(:backstage) { Backstage.new(15, 20) }

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
        let(:items) { [ StandardItem.new(name, 0, 10) ] }
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
        let(:items) { [ StandardItem.new(name, 10, 0) ] }
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
      let(:fine_cheese) { aged_brie.name }

      context "increases in quality each day" do
        its(:sell_in) { should eq 1 }
        its(:quality) { should eq 1 }
      end

      context "when already at max quality" do
        let(:items) { [ AgedBrie.new(2, 50) ] }
        its(:quality) { should eq 50 }
      end

      context "when expired" do
        let(:items) { [ AgedBrie.new(0, 20) ] }

        context "quality increases twice as fast" do
          its(:quality) { should eq 22 }
        end
      end
    end

    context "sulfuras" do
      let(:fine_cheese) { sulfuras.name }

      context "when not expired" do
        let(:items) { [ Sulfuras.new(3, 80) ] }

        its(:quality) { should eq 80 }
      end

      context "when expired" do
        let(:items) { [ Sulfuras.new(0, 80) ] }

        its(:quality) { should eq 80 }
      end

      context "if quality ever happened to be below 80" do
        let(:items) { [ Sulfuras.new(0, 35) ] }

        its(:quality) { should eq 35 }
      end
    end

    context "Backstage Passes" do
      let(:items) { [ item ] }
      let(:fine_cheese) { backstage.name }

      context "increases in quality each day" do
        let(:item) { backstage }

        its(:sell_in) { should eq 14 }
        its(:quality) { should eq 21 }
      end

      context "when 10 days down to 6" do
        10.downto(6) { |i|
          context "when #{i} days should increase by 2" do
            let(:item) { Backstage.new(i, 10) }
            its(:quality) { should eq (12) }
          end
        }
      end

      context "when 5 days down to 1" do
        5.downto(1) { |i|
          context "when #{i} days should increase by 3" do
            let(:item) { Backstage.new(i, 10) }
            its(:quality) { should eq (13) }
          end
        }
      end

      context "when 0 days should go to 0" do
        let(:item) { Backstage.new(0, 10) }
        its(:quality) { should eq (0) }
      end
    end
  end
end

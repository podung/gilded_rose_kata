require './item_wrapper.rb'

class GildedRose
  DEXTERITY = "+5 Dexterity Vest"
  AGED_BRIE = "Aged Brie"
  ELIXIR    = "Elixir of the Mongoose"
  SULFURAS  = "Sulfuras, Hand of Ragnaros"
  BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert"
  CONJURED  = "Conjured Mana Cake"


  attr_accessor :items
  @items = []

  def initialize
    @items = []
    @items << ItemWrapper.new(DEXTERITY, 10, 20)
    @items << ItemWrapper.new(AGED_BRIE, 2, 0)
    @items << ItemWrapper.new(ELIXIR, 5, 7)
    @items << ItemWrapper.new(SULFURAS, 0, 80)
    @items << ItemWrapper.new(BACKSTAGE, 15, 20)
    @items << ItemWrapper.new(CONJURED, 3, 6)
  end

  def update_quality

    @items.each { |item|
      if [DEXTERITY, ELIXIR, CONJURED].include? item.name
        item.reduce_quality
        item.reduce_quality if item.expired?
      end

      if [AGED_BRIE].include? item.name
        item.increase_quality
        item.increase_quality if item.expired?
      end

      if [BACKSTAGE].include? item.name
        item.increase_quality
        item.increase_quality if item.sell_in < 11
        item.increase_quality if item.sell_in < 6
        item.zero_out_quality if item.expired?
      end

      if [DEXTERITY, AGED_BRIE, ELIXIR, BACKSTAGE, CONJURED].include? item.name
        item.reduce_sell_in
      end
    }
  end
end

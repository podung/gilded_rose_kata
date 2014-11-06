require_relative 'items/item_wrapper.rb'
require_relative 'items/standard_item.rb'
require_relative 'items/aged_brie.rb'
require_relative 'items/backstage.rb'
require_relative 'items/sulfuras.rb'

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
    @items << StandardItem.new(DEXTERITY, 10, 20)
    @items << StandardItem.new(ELIXIR, 5, 7)
    @items << StandardItem.new(CONJURED, 3, 6)
    @items << AgedBrie.new(AGED_BRIE, 2, 0)
    @items << ItemWrapper.new(SULFURAS, 0, 80)
    @items << Backstage.new(BACKSTAGE, 15, 20)
  end

  def update_quality

    @items.each { |item|
      item.update_quality

      if [DEXTERITY, AGED_BRIE, ELIXIR, BACKSTAGE, CONJURED].include? item.name
        item.reduce_sell_in
      end
    }
  end
end

require_relative 'items/item_wrapper.rb'
require_relative 'items/dexterity.rb'
require_relative 'items/elixer.rb'
require_relative 'items/conjured.rb'
require_relative 'items/aged_brie.rb'
require_relative 'items/backstage.rb'
require_relative 'items/sulfuras.rb'

class GildedRose
  attr_accessor :items
  @items = []

  def initialize
    @items = []
    @items << Dexterity.new(10, 20)
    @items << Elixer.new(5, 7)
    @items << Conjured.new(3, 6)
    @items << AgedBrie.new(2, 0)
    @items << Sulfuras.new(0, 80)
    @items << Backstage.new(15, 20)
  end

  def update_quality
    @items.each do |item|
      item.update_quality
      item.reduce_sell_in
    end
  end
end

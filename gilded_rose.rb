require './item.rb'

class GildedRose
  DEXTERITY = "+5 Dexterity Vest"
  AGED_BRIE = "Aged Brie"
  ELIXIR    = "Elixir of the Mongoose"
  SULFURAS  = "Sulfuras, Hand of Ragnaros"
  BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert"
  CONJURED  = "Conjured Mana Cake"

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  attr_accessor :items
  @items = []

  def initialize
    @items = []
    @items << Item.new(DEXTERITY, 10, 20)
    @items << Item.new(AGED_BRIE, 2, 0)
    @items << Item.new(ELIXIR, 5, 7)
    @items << Item.new(SULFURAS, 0, 80)
    @items << Item.new(BACKSTAGE, 15, 20)
    @items << Item.new(CONJURED, 3, 6)
  end

  def update_quality

    @items.each { |item|
      if [DEXTERITY, ELIXIR, CONJURED].include? item.name
        reduce_quality(item) if item.quality > 0
      end

      if [AGED_BRIE, BACKSTAGE].include? item.name
        increase_quality(item)
      end

      if item.name == BACKSTAGE
        if (item.sell_in < 11)
          increase_quality(item)
        end
        if (item.sell_in < 6)
          increase_quality(item)
        end
      end

      if (item.name != SULFURAS)
        reduce_sell_in(item)
      end

      if (item.sell_in < 0)
        if (item.name != AGED_BRIE)
          if (item.name != BACKSTAGE)
            if (item.name != SULFURAS)
              reduce_quality(item)
            end
          else
            zero_out_quality(item)
          end
        else
          increase_quality(item)
        end
      end
    }
  end

  def reduce_quality(item)
    item.quality -= 1 if item.quality > MIN_QUALITY
  end

  def increase_quality(item)
    item.quality += 1 if item.quality < MAX_QUALITY
  end

  def zero_out_quality(item)
    item.quality = 0
  end

  def reduce_sell_in(item)
    item.sell_in -= 1
  end
end

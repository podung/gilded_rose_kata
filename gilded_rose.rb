require './item.rb'

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
    @items << Item.new(DEXTERITY, 10, 20)
    @items << Item.new(AGED_BRIE, 2, 0)
    @items << Item.new(ELIXIR, 5, 7)
    @items << Item.new(SULFURAS, 0, 80)
    @items << Item.new(BACKSTAGE, 15, 20)
    @items << Item.new(CONJURED, 3, 6)
  end

  def update_quality

    @items.each { |item|
      if [DEXTERITY, ELIXIR, SULFURAS, CONJURED].include?(item.name)
        if quality_above(item, 0)
          if (item.name != SULFURAS)
            reduce_quality(item)
          end
        end
      end

      if (item.name == AGED_BRIE || item.name == BACKSTAGE)
        if quality_below(item, 50)
          increase_quality(item)
          if (item.name == BACKSTAGE)
            if (item.sell_in < 11)
              if quality_below(item, 50)
                increase_quality(item)
              end
            end
            if (item.sell_in < 6)
              if quality_below item, 50
                increase_quality(item)
              end
            end
          end
        end
      end
      if (item.name != SULFURAS)
        reduce_sell_in(item)
      end
      if (item.sell_in < 0)
        if (item.name != AGED_BRIE)
          if (item.name != BACKSTAGE)
            if quality_above item, 0
              if (item.name != SULFURAS)
                reduce_quality(item)
              end
            end
          else
            zero_out_quality(item)
          end
        else
          if quality_below item, 50
            increase_quality(item)
          end
        end
      end
    }
  end

  def reduce_quality(item)
    item.quality -= 1
  end

  def increase_quality(item)
    item.quality += 1
  end

  def zero_out_quality(item)
    item.quality = 0
  end

  def reduce_sell_in(item)
    item.sell_in -= 1
  end

  def quality_below(item, threshhold)
    item.quality < threshhold
  end

  def quality_above(item, threshhold)
    item.quality > threshhold
  end
end

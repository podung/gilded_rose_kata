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

    for i in 0..(@items.size-1)
      if (@items[i].name != AGED_BRIE && @items[i].name != BACKSTAGE)
        if (@items[i].quality > 0)
          if (@items[i].name != SULFURAS)
            reduce_quality(@items[i])
          end
        end
      else
        if (@items[i].quality < 50)
          @items[i].quality = @items[i].quality + 1
          if (@items[i].name == BACKSTAGE)
            if (@items[i].sell_in < 11)
              if (@items[i].quality < 50)
                @items[i].quality = @items[i].quality + 1
              end
            end
            if (@items[i].sell_in < 6)
              if (@items[i].quality < 50)
                @items[i].quality = @items[i].quality + 1
              end
            end
          end
        end
      end
      if (@items[i].name != SULFURAS)
        @items[i].sell_in = @items[i].sell_in - 1;
      end
      if (@items[i].sell_in < 0)
        if (@items[i].name != AGED_BRIE)
          if (@items[i].name != BACKSTAGE)
            if (@items[i].quality > 0)
              if (@items[i].name != SULFURAS)
                reduce_quality(@items[i])
              end
            end
          else
            @items[i].quality = @items[i].quality - @items[i].quality
          end
        else
          if (@items[i].quality < 50)
            @items[i].quality = @items[i].quality + 1
          end
        end
      end
    end
  end

  def reduce_quality(item)
    item.quality -= 1
  end
end

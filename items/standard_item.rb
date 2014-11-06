require_relative 'item_wrapper.rb'

class StandardItem < ItemWrapper
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality
    reduce_quality
    reduce_quality if expired?
  end
end

class Dexterity < StandardItem
  def initialize(sell_in, quality)
    super("+5 Dexterity Vest", sell_in, quality)
  end
end

class Elixer < StandardItem
  def initialize(sell_in, quality)
    super("Elixir of the Mongoose", sell_in, quality)
  end
end

class Conjured < StandardItem
  def initialize(sell_in, quality)
    super("Conjured Mana Cake", sell_in, quality)
  end
end

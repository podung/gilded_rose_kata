require_relative 'standard_item.rb'

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

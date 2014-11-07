require_relative 'standard_item.rb'

class Conjured < StandardItem
  def initialize(sell_in, quality)
    super("Conjured Mana Cake", sell_in, quality)
  end
end

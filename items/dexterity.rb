require_relative 'standard_item.rb'

class Dexterity < StandardItem
  def initialize(sell_in, quality)
    super("+5 Dexterity Vest", sell_in, quality)
  end
end

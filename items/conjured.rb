require_relative 'item_wrapper.rb'

class Conjured < ItemWrapper
  def initialize(sell_in, quality)
    super("Conjured Mana Cake", sell_in, quality)
  end

  def update_quality
    2.times { reduce_quality }
    2.times { reduce_quality } if expired?
  end
end

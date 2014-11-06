require_relative 'item_wrapper.rb'

class Backstage < ItemWrapper
  def initialize(sell_in, quality)
    super("Backstage passes to a TAFKAL80ETC concert", sell_in, quality)
  end

  def update_quality
    increase_quality
    increase_quality if sell_in < 11
    increase_quality if sell_in < 6
    zero_out_quality if expired?
  end
end

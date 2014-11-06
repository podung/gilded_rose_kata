require_relative 'item_wrapper.rb'

class Backstage < ItemWrapper
  def initialization(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality
    increase_quality
    increase_quality if sell_in < 11
    increase_quality if sell_in < 6
    zero_out_quality if expired?
  end
end

require_relative 'item_wrapper.rb'

class AgedBrie < ItemWrapper
  def initialization(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality
    increase_quality
    increase_quality if expired?
  end
end

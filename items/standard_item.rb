require_relative 'item_wrapper.rb'

class StandardItem < ItemWrapper
  def initialization(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality
    reduce_quality
    reduce_quality if expired?
  end
end

require_relative 'item_wrapper.rb'

class Sulfuras < ItemWrapper
  def initialize(sell_in, quality)
    super("Sulfuras, Hand of Ragnaros", sell_in, quality)
  end

  def update_quality; end #noop
  def reduce_sell_in; end #noop overriding base behavior
end

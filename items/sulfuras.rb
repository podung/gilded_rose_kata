require_relative 'item_wrapper.rb'

class Sulfuras < ItemWrapper
  def initialization(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality; end #noop
  def reduce_sell_in; end #noop overriding base behavior
end

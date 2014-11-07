require_relative 'standard_item.rb'

class Elixer < StandardItem
  def initialize(sell_in, quality)
    super("Elixir of the Mongoose", sell_in, quality)
  end
end

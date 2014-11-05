require './item.rb'

class ItemWrapper
  attr_reader :name, :quality, :sell_in

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(name, sell_in, quality)
    @item = Item.new(name, sell_in, quality)
  end

  def name
    @item.name
  end

  def quality
    @item.quality
  end

  def sell_in
    @item.sell_in
  end

  def increase_quality
    @item.quality += 1 if @item.quality < MAX_QUALITY
  end

  def reduce_quality
    @item.quality -= 1 if @item.quality > MIN_QUALITY
  end

  def zero_out_quality
    @item.quality = 0
  end
  def reduce_sell_in
    @item.sell_in -= 1
  end

  def increase_sell_in
    @item.sell_in -= 1
  end

  def expired?
    @item.sell_in <= 0
  end
end

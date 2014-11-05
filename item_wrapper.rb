require './item.rb'

class ItemWrapper < Item
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def increase_quality
    @quality += 1 if @quality < MAX_QUALITY
  end

  def reduce_quality
    @quality -= 1 if @quality > MIN_QUALITY
  end

  def zero_out_quality
    @quality = 0
  end

  def reduce_sell_in
    @sell_in -= 1
  end

  def increase_sell_in
    @sell_in -= 1
  end

  def expired?
    @sell_in <= 0
  end
end

require_relative 'item_wrapper.rb'

class StandardItem < ItemWrapper
  def update_quality
    reduce_quality
    reduce_quality if expired?
  end
end

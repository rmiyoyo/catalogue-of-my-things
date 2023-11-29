# label.rb
require_relative 'item'

class Label
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @item = []
  end

  def add_item(item)
    @items << item
    item.set.label(self)
  end
end

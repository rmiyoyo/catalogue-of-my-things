# label.rb
require_relative 'item'

class Label
  attr_accessor :name, :title, :color_item, :items

  def initialize(name, title, color_item)
    @name = name
    @title = title
    @color_item = color_item
    @item = []
  end

  def add_item(item)
    @items << item
    item.set.label(self)
  end
end

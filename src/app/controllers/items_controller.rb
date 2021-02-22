require_relative '../repositories/item_repository'
require_relative '../views/view_item'
require_relative '../models/item'

class ItemsController
  def initialize(item_repository)
    @item_repository = item_repository
    @view_item = ViewItem.new
  end

  def list
    display_items
  end

  def add
    name = @view_item.ask_for_element("name")
    price = @view_item.ask_for_element("price").to_i

    item = item.new(name: name, price: price)
    @item_repository.create(item)
  end

  def delete
    display_items
    index = @view_item.ask_for_index("delete")
    @item_repository.destroy(index)
  end

  def edit
    display_items
    index = @view_item.ask_for_index("edit")
    name = @view_item.ask_for_element_new("name")
    price = @view_item.ask_for_element_new("price").to_i
    @item_repository.edit(index, name, price)
  end

  private

  def display_items
    items = @item_repository.all
    @view_item.display(items)
  end
end

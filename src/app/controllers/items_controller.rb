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
    @view_item.new_item
    code = @view_item.ask_for_element('code')
    name = @view_item.ask_for_element('name')
    price = @view_item.ask_for_element('price').to_f

    item = Item.new(code: code, name: name, price: price)
    @item_repository.create(item)
  end

  def delete
    display_items
    index = @view_item.ask_for_index('delete')
    @item_repository.destroy(index)
  end

  def edit
    unless @item_repository.all.empty?
      display_items
      index = @view_item.ask_for_index('edit')
      code = @view_item.ask_for_element_new('code')
      name = @view_item.ask_for_element_new('name')
      price = @view_item.ask_for_element_new('price').to_f
      @item_repository.edit(index, code, name, price)
    else
      @view_item.no_edit
    end
  end

  private

  def display_items
    items = @item_repository.all
    @view_item.display(items)
  end
end

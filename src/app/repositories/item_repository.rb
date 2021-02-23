require 'csv'
require_relative '../models/item'

class ItemRepository
  def initialize(file_path)
    @csv_file_path = file_path
    @items = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(item)
    item.id = @next_id
    @items << item
    save_csv
    @next_id += 1
  end

  def all
    @items
  end

  def destroy(index)
    @items.delete_at(index)
    save_csv
  end

  def edit(index, code, name, price)
    item = @items[index]
    item.code = code
    item.name = name
    item.price = price
    save_csv
  end

  def find(id)
    @items.find { |item| item if item.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      attributes = {
        id: row[:id].to_i, code: row[:code], name: row[:name], price: row[:price].to_f
      }
      @items << Item.new(attributes)
    end
    @next_id = @items.empty? ? 1 : @items.last.id + 1
  end

  def save_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << Item.header
      @items.each do |item|
        csv << item.to_row
      end
    end
  end
end

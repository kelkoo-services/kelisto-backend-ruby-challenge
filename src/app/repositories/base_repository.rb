# frozen_string_literal: true

require 'csv'

class BaseRepository
  def initialize(file_path)
    @csv_file_path = file_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(element)
    element.id = @next_id
    @elements << element
    save_csv
    @next_id += 1
  end

  def all
    @elements
  end

  def destroy(index)
    @elements.delete_at(index)
    save_csv
  end

  def edit(index, name)
    element = @elements[index]
    element.name = name
    save_csv
  end

  def find(id)
    @elements.find { |element| element if element.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      attributes = {
        id: row[:id].to_i, code: row[:code], name: row[:name], price: row[:price].to_i
      }
      @items << Item.new(attributes)
    end
    @next_id = @items.empty? ? 1 : @items.last.id + 1
  end

  def save_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << Element.header
      @elements.each do |element|
        csv << element.to_row
      end
    end
  end
end

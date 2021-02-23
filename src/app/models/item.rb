# frozen_string_literal: true

class Item
  attr_accessor :id, :code, :name, :price

  def self.header
    %w[id code name price]
  end

  def initialize(properties = {})
    @id = properties[:id]
    @name = properties[:name]
    @code = properties[:code]
    @price = properties[:price]
  end

  def to_row
    [id, code, name, price]
  end
end

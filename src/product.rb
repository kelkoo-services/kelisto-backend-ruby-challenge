require_relative 'lib/data'
require_relative 'lib/mass_initialize'

class Product
  class InvalidCodeError < StandardError; end;

  attr_accessor :code, :name, :price, :currency

  include MassInitialize

  # find, find_all (& maybe other methods) could also be on a ProductRepository class
  def self.find(code)
    data = Data.products[code]
    raise InvalidCodeError unless data

    self.new data
  end
end

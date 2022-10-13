require 'yaml'

# this is helper class to load data for products & discounts using YAML files
# usually this shouldn't be necesarry as we'd be using DB
class Data
  class << self
    # reads a given yml file from data folder
    def load_file(fname, base_path = nil)
      base_path ||= File.expand_path('../../../data', __FILE__)
      YAML.load_file(base_path+"/#{fname}.yml").fetch(fname)
    end

    # similar to ActiveSupport index_by
    def to_indexed_hash(data = [], field = 'id')
      data.map{ |i| [i[field], i] }.to_h
    end

    # returns all products from products.yml indexed by code
    def products
      to_indexed_hash load_file('products'), 'code'
    end

    # returns all discounts rules from discounts.yml indexed by code
    def discounts
      to_indexed_hash load_file('discounts'), 'code'
    end
  end

end

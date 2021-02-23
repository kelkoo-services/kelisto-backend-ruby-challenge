# frozen_string_literal: true

require 'fileutils'
require_relative 'support/csv_helper'

begin
  require_relative '../app/repositories/item_repository'
rescue LoadError => e
  if e.message =~ /item_repository/
    describe 'ItemRepository' do
      it 'You need a `item_repository.rb` file for your `ItemRepository`' do
        raise
      end
    end
  else
    raise e
  end
end

describe 'ItemRepository', :item do
  let(:items) do
    [
      %w[id code name price],
      [1, 'GR1', 'Green tea', 3.11],
      [2, 'SR1', 'Strawberry', 5],
      [3, 'CF1', 'Coffee', 11.23]
    ]
  end
  let(:csv_path) { 'spec/support/items.csv' }

  before(:each) do
    CsvHelper.write_csv(csv_path, items)
  end

  def elements(repo)
    repo.instance_variable_get(:@items) ||
      repo.instance_variable_get(:@elements)
  end

  describe 'prices' do
    it 'GR1 should have a price of 3.11' do
      repo = ItemRepository.new(csv_path)
      loaded_items = elements(repo) || []
      expect(loaded_items.find { |item| item if item.code == "GR1" }.price).to eq(3.11)
    end

    it 'SR1 should have a price of 5' do
      repo = ItemRepository.new(csv_path)
      loaded_items = elements(repo) || []
      expect(loaded_items.find { |item| item if item.code == "SR1" }.price).to eq(5)
    end

    it 'CF1 should have a price of 11.23' do
      repo = ItemRepository.new(csv_path)
      loaded_items = elements(repo) || []
      expect(loaded_items.find { |item| item if item.code == "CF1" }.price).to eq(11.23)
    end
  end
end

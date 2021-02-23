# frozen_string_literal: true

require_relative 'support/csv_helper'

begin
  require_relative '../app/repositories/item_repository'
  require_relative '../app/repositories/user_repository'
  require_relative '../app/repositories/order_repository'
  require_relative '../app/controllers/orders_controller'
rescue LoadError => e
  describe 'OrdersController' do
    it 'You need a `orders_controller.rb` file for your `OrdersController`' do
      raise
    end
  end
end

describe 'OrdersController', :_order do
  let(:items) do
    [
      %w[id code name price],
      [1, 'GR1', 'Green tea', 3.11],
      [2, 'SR1', 'Strawberry', 5],
      [3, 'CF1', 'Coffee', 11.23]
    ]
  end
  let(:users_csv_path) { 'spec/support/users.csv' }
  let(:user_repository) { UserRepository.new(users_csv_path) }

  let(:users) do
    [
      %w[id username password role],
      [1, 'admin', 'password', 'admin'],
      [2, 'client', 'password', 'client']
    ]
  end
  let(:items_csv_path) { 'spec/support/items.csv' }
  let(:item_repository) { ItemRepository.new(items_csv_path) }

  let(:orders) do
    [
      %w[id items user total],
      [1, 'GR1 | SR1 | GR1 | GR1 | CF1', 2, 22.45],
      [2, 'GR1 | GR1', 2, 3.11],
      [3, 'SR1 | SR1 | GR1 | SR1', 2, 16.61]
    ]
  end

  let(:orders_csv_path) { 'spec/support/orders.csv' }
  let(:order_repository) { OrderRepository.new(orders_csv_path, item_repository, user_repository) }

  before(:each) do
    CsvHelper.write_csv(items_csv_path, items)
    CsvHelper.write_csv(users_csv_path, users)
    CsvHelper.write_csv(orders_csv_path, orders)
  end

  def elements(repo)
    repo.instance_variable_get(:@orders) ||
      repo.instance_variable_get(:@elements)
  end

  describe 'offers' do
    it 'should apply buy one get one free for GR1 and discount the prices of ST1 to 4.5 when buying more than 3' do
      controller = OrdersController.new(item_repository, user_repository, order_repository)

      expect(order_repository.all[0].total).to eq(22.45)
      expect(order_repository.all[1].total).to eq(3.11)
      expect(order_repository.all[2].total).to eq(16.61)
    end
  end
end

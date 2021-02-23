# frozen_string_literal: true

require 'csv'
require_relative '../models/order'
require_relative '../repositories/item_repository'
require_relative '../repositories/user_repository'

class OrderRepository
  def initialize(file_path, item_repository, user_repository)
    @csv_file_path = file_path
    @item_repository = item_repository
    @user_repository = user_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(order)
    order.id = @next_id
    @orders << order
    save_csv
    @next_id += 1
  end

  def all
    @orders
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:items] = row[:items]
      row[:user] = @user_repository.find(row[:user].to_i)
      @orders << Order.new(row)
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def save_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << Order.header
      @orders.each do |order|
        csv << order.to_row
      end
    end
  end
end

# frozen_string_literal: true

require 'csv'
require_relative '../models/user'
require 'byebug'

class UserRepository
  def initialize(file_path)
    @csv_file_path = file_path
    @users = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @users
  end

  def find(id)
    @users.find { |user| user if user.id == id }
  end

  def find_by_username(username)
    @users.find do |user|
      user.username == username
    end
  end

  def create(user)
    user.id = @next_id
    @users << user
    save_csv
    @next_id += 1
  end

  def destroy(index)
    @users.delete_at(index)
    save_csv
  end

  def edit(index, username, password, role)
    user = @users[index]
    user.username = username
    user.password = password
    user.role = role
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      attributes = { id: row[:id].to_i, username: row[:username], password: row[:password], role: row[:role] }
      @users << User.new(attributes)
    end
    @next_id = @users.empty? ? 1 : @users.last.id + 1
  end

  def save_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << User.header
      @users.each do |user|
        csv << user.to_row
      end
    end
  end
end

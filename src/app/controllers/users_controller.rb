# frozen_string_literal: true

require_relative '../repositories/user_repository'
require_relative '../views/view_user'
require_relative '../models/user'

class UserController
  def initialize(user_repository)
    @user_repository = user_repository
    @view = ViewUser.new
  end

  def list
    display_users
  end

  def add
    username = @view.ask_for_element('username')
    password = @view.ask_for_element('password')

    user = User.new(username: username, password: password, role: 'client')
    @user_repository.create(user)
  end

  def delete
    display_users
    index = @view.ask_for_index('delete')
    @user_repository.destroy(index)
  end

  def edit
    display_users
    loop do
      index = @view.ask_for_index('edit')
      next unless (index <= @user_repository.all.length) && (index != 0)

      username = @view.ask_for_element_new('username')
      password = @view.ask_for_element_new('password')
      role = 'client'
      @user_repository.edit(index, username, password, role)
      break
    end
  end

  private

  def display_users
    users = @user_repository.all
    @view.display(users)
  end
end

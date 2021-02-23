# frozen_string_literal: true

require_relative '../views/view_session'

class SessionsController
  def initialize(repository)
    @repository = repository
    @view = SessionsView.new
  end

  def create
    username = @view.ask_for_username
    password = @view.ask_for_password
    user = @repository.find_by_username(username)
    if user && user.password == password
      user
    else
      @view.display_wrong_credentials
      create
    end
  end
end

class User
  attr_reader :username, :password, :role
  attr_accessor :id

  def self.header
    ['id', 'username', 'password', 'role']
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def to_row
    [id, username, password]
  end

  def admin?
    @role == 'admin'
  end
end

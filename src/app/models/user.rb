class User
  attr_accessor :id, :username, :password, :role

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
    [id, username, password, role]
  end

  def admin?
    @role == 'admin'
  end
end

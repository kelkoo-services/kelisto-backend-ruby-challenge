class Order
  attr_accessor :id, :items, :user, :total

  def self.header
    ['id', 'items', 'user', 'total']
  end

  def initialize(properties = {})
    @id = properties[:id]
    @items = properties[:items]
    @user = properties[:user]
    @total = properties[:total].to_f
  end

  def to_row
    [id, items, user.id, total]
  end
end

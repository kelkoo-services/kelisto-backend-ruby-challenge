class Product
  attr_accessor :id, :name, :code, :active, :price, :currency

  def initialize(id, name, code, active=true)
    @id     = id
    @name   = name
    @code   = code
    @active = active
  end

end

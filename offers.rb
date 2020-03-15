class Offer
  attr_accessor :id,:product_id,:offer,:active

  def initialize(id, product_id, offer, active=true)
    @id          = id
    @product_id  = product_id
    @offer       = offer
    @active      = active
  end

end

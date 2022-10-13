require_relative 'lib/data'
require_relative 'lib/mass_initialize'


class Discount
  class InvalidDiscountTypeError < StandardError; end;
  attr_accessor :code, :name
  attr_reader :amount

  include MassInitialize

  # we can handle many types of discounts
  # BuyXPayY: to get 1 item for free, 3x2, 2x1 and similar stuff
  # BulkPercent: get % discount when purchasing more than X units
  # BulkLowerPrice: get a lower price when purchasing more than X units

  # there're many things which could be added to this code, but no time for them
  # - control if we want to exclude applying multiple discounts on same product
  # - check and apply only the best discount when multiple options are available

  # Creates a new discount object based on config values
  # each discount type may require different attributes
  # check attr_accessor on each of the children
  def self.build(conf = {})
    conf.transform_keys!(&:to_sym)
    klass = conf.fetch(:type)
    raise InvalidDiscountTypeError unless klass

    Object.const_get("Discounts::#{klass}").new(conf)
  rescue NameError => e
    raise InvalidDiscountTypeError.new e.message
  end

  # this will be implemented in each subclass to handle specific logic
  def apply_to(cart)
    raise NoMethodError.new "Subclass needs to implement 'apply_to' method"
  end

  def to_s
    sprintf("%-6s%-20.18s = %6.2f", code, name, amount.round(2))
  end

end

# would like to load this on top, but then I get undefined errors because Discount is not yet defined
Dir[File.join(__dir__, 'discounts', '*.rb')].each { |file| require file }

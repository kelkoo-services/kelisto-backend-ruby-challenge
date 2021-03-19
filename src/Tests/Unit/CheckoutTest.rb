load 'Models/Checkout.rb'
require "json"
require 'test/unit'
 
class MiPrimerTest < Test::Unit::TestCase

  @@file = File.read('./Data/pricing_rules.json')
  @@pricing_rules = JSON.parse(@@file)
  @@co = Checkout.new(@@pricing_rules)

  def test_green_tea_offer
    @@items = "GR1".split(',')
    assert_equal({"ItemCodes"=>"GR1, GR1", "TotalPrice"=>"3.11"} , returnData(@@items))
  end

  def test_strawberries_offer 
    @@items = "SR1,SR1,SR1,SR1".split(',')
    assert_equal({"ItemCodes"=>"SR1, SR1, SR1, SR1", "TotalPrice"=>"18.0"},returnData(@@items))
  end

  def test_mix 
    @@items = "GR1,SR1,GR1,SR1,CF1,CF1,CF1,SR1,GR1,HGHGHASD,GR1".split(',')
    assert_equal({"ItemCodes"=>"GR1, GR1, SR1, GR1, GR1, SR1, CF1, CF1, CF1, SR1, GR1, GR1, GR1, GR1", "TotalPrice"=>"61.13"},returnData(@@items))
  end

  def test_error 
    @@items = "G".split(',')
    assert_equal({"ItemCodes"=>"", "TotalPrice"=>"null"},returnData(@@items))
  end

  def returnData(items)
    items.each do |item|
        @@co.scan(item)
    end
    return @@co.total
  end
  
end
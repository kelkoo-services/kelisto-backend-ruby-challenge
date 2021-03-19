class Checkout
    @@total_price = 0
    @@checkout_items = []
    GREEN_TEA_OFFER = "buy-one-get-one-free"
    STRAWBERRIES_OFFER = "buy-more-than-three"

    def initialize(pricing_rules)
       @check_pricing_rules = pricing_rules
    end

    def scan(item)
       @@checkout_items.push(item)
    end

    def total()
        @@total_price = 0
        @@checkout_item_codes = ""
        @@total_strawberries = 0
        @@checkout_items.each_with_index do |item, i|
            @check_pricing_rules.each do |pricing_rule|
                if (item == pricing_rule['ItemCode'])
                    
                    if (GREEN_TEA_OFFER == pricing_rule['EspecialRule'])
                        (i != (@@checkout_items.length)) ? @@checkout_item_codes += item + ", " : @@checkout_item_codes += item
                    elsif (STRAWBERRIES_OFFER == pricing_rule['EspecialRule'])
                        @@total_strawberries += 1
                    end

                    @@total_price += Float pricing_rule['Price']
                    (i != (@@checkout_items.length - 1)) ? @@checkout_item_codes += item + ", " : @@checkout_item_codes += item
                end
            end
        end
        if (@@total_strawberries > 3)
               @@total_strawberries = @@total_strawberries * 0.5
               @@total_price -= @@total_strawberries
        end
        if @@total_price == 0
            return {"ItemCodes" => "", "TotalPrice" => "null"}
        end
        @@checkout_items = []
       return {"ItemCodes" => @@checkout_item_codes, "TotalPrice" => (String @@total_price.round(2))}
    end
end
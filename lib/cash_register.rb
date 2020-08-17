
class CashRegister	
  attr_accessor :discount, :total, :latest_add, :items
  
    def initialize(discount=0)	
      @discount = discount	
      @total = 0	
      @items = []
    end

    def add_item (item, price, quantity =1)
        @total += price * quantity
        @latest_add = [price, quantity, item]
        quantity.times {@items << item } 
    end

    def apply_discount
            @discount.zero?() ? "There is no discount to apply." : "After the discount, the total comes to $#{@total -= (@total *@discount/100)}."
    end
    
    def void_last_transaction
       @total -= @latest_add[0] * @latest_add[1]
        @latest_add[1].times {@items.pop}
    end


end
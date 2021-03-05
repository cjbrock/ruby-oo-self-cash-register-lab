require 'pry'
class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end


    def add_item(item, price, quantity=1)
        # binding.pry
        #keep track of a running total
        #take the total
        self.total += price*quantity
        #add the current items to it
        quantity.times do 
            self.items << item
        end
        # return the total
        self.last_transaction = price * quantity
    end


    def apply_discount
        # check to see if the discount isn't zero
        if self.discount != 0
            # take the total and do some math - "After the discount, the total comes to $800."
            self.total = (total-(total*(discount.to_f/100))).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        self.total = self.total - self.last_transaction
    end


end


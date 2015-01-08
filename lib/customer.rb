# class UnfinalizedOrder < Exception
# 	def message
# 		"Order has not been finalized"
# 	end
# end

class Customer

	def initialize
		@basket = []
	end

	def basket_size
		@basket.length
	end

	def add_order(menu, item, quantity=1)
		menu.add_prices_to_array(item.to_sym, quantity)
		quantity.times{@basket << menu.add_to_basket(item.to_sym, quantity)}
	end

	def remove_order(menu, item, quantity=1)
		@basket.delete(item) unless remove_prices(menu, item, quantity) == nil
	end


	def basket_total_cost(menu)
		menu.calculate_price
	end	

	def finalize_basket
		self.finalize
	end

	def finalize
		true
	end

	def complete_basket
		@basket
	end

	def send_finalized_order_to_shop(shop=shop, basket=customer.complete_basket)
		# if finalize == true #finalize always true at the moment!!!
			shop.receive_order(basket)
		# else raise UnfinalizedOrder
		# end
	end

private

	def remove_prices(menu, item, quantity=1)
		menu.remove_prices_from_array(item.to_sym, quantity)
	end

end
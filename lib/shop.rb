require_relative 'message'
require 'twilio-ruby' 

class Shop

	include Message	

	def initialize
		@finalized_order = {}
	end

	def receive_order(order, prices)
		@finalized_order = Hash[order.uniq.zip(prices)]
	end

	def finalized_order
		@finalized_order.length
	end

	def price
		@finalized_order.values.inject(:+)
	end

	def confirm_price(customer, menu)
		true if customer.basket_total_cost(menu) == price
	end

	def send_message
		self.send_text create_message
	end

	def confirm_order
		send_message if confirm_price == true
	end

end	
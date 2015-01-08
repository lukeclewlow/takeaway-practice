require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby' 
require './ACCOUNT_SID'
require './AUTH_TOKEN'

	module Message

		def create_message
			message_content = @finalized_order.keys.each { |key| p "#{key}, " }
			"You have ordered: #{message_content.join(", ")} which comes to a total of £#{price} and will be delivered before #{time}"
		end
			
		def time
			Time.new.utc + 3600
		end

		def send_text	message
			@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

			@client.account.messages.create({
				:from => '+441442796256', 
				:to => '+447856953621', 
				:body => message,  
			})
			p "Message sent..."
		end

	end
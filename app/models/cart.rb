class Cart 

	attr_reader :items

	def self.build_from_hash hash #build a cart item from the items hash (this hash represents the session)
		items = if hash["cart"] then #check if the cart is actually there
			hash["cart"]["items"].map do |item_data| 
			CartItem.new item_data["product_id"], item_data["quantity"]
		end
		else
			[] #otherwise (if the hash cart does not exist) return an empty array
		end

		new items
	end

	def initialize items = [] # initialize the cart with an items array. It is in this array that all the items will be put.
		@items = items #the global variable @items will have the value of the items array
	end


	def add_item product_id

		item = @items.find{ |item| item.product_id == product_id } # find an item with the same product_id as the one being added
		if item # if that item is found...
			item.increment # increment the quantity of the product in the catItem 
			# puts "testing"
		else #if it's not there ...
			@items << CartItem.new(product_id) # create a cartItem and add it to the items array.
			#  puts "nice"
		end
	end

	def count
		@items.length
	end

	def empty?
		@items.empty?
	end

	def serialize #creates an items hash from the items array

		items = @items.map do |item| #we have to iterate through the array, each array item will be stored in the variable item
			{
				"product_id" => item.product_id,  #now create a hash key "product_id" with the value in item called product_id
				"quantity" => item.quantity       #and a key called "quantity" with the value item.quantity
			}
		end 

		

		{
			
			"items" => items  #add the items into the cart
			
		}
		
	end

	def total_price
		@items.inject(0) { |sum, item| sum + item.total_price } # the inject method initializes sum to 0 so 0 + item.price
		#the iterator will go through all the items in teh cart
	end
end

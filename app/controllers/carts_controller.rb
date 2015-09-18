class CartsController < ApplicationController
	before_filter :initialize_cart

	def add 
		@cart.add_item params[:id] # add the item to the cart
		session["cart"] = @cart.serialize # update the cart item in the session variable/hash
		product = Product.find params[:id]
		redirect_to :back, notice: "Added #{product.name} to cart."
	end

	def show
	end

	def checkout
		@order_form = OrderForm.new user: User.new #this is an order form object that uses Active Model to recieve (informstion)parameters from outside
	end
end
class  OrdersController < ApplicationController
	before_filter :initialize_cart # very important. to create anorder we need the information in the cart

	def create
		@order_form = OrderForm.new(
			user: User.new( order_params[:user] ),
			cart: @cart # we need the cart inorder to process the order. so we pass an instance variable, because we already initialized the cart
			)

		if @order_form.save
			redirect_to root_path, notice: "Thank you for placing your order."
		else
			render "carts/checkout" # make sure to return the the checkout page if it doesn't save
		end

	end

	


	private

	def order_params
		params.require(:order_form).permit(
			user: [:name, :phone, :address, :city, :country, :postal_code, :email]
			)
	end

	
end
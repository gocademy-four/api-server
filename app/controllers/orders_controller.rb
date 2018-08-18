class OrdersController < ApplicationController
	def create
		params.require(:teached_lesson_id)

		order = Order.new
		order.customer = Customer.find_by!(member_id: current_user.id)
		order.teachedlesson = Teachedlesson.find_by!(id: params[:teached_lesson_id])
		order.save!

		render json: {}
	end

	def show
		render json: Order.find_by!(id: params[:id])
	end

	def index
		current_customer_id = Customer.where(id: current_user.id)

		render json: Order.where(customer_id: current_customer_id)
	end
end

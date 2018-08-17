class OrdersController < ApplicationController
	def create
		params.require(:teached_lesson_id)

		order = Order.new
		order.customer = Customer.find_by!(member_id: current_user.id)
		order.teachedlesson = Teachedlesson.find_by!(id: params[:teached_lesson_id])
		order.save!

		render json: {}
	end
end

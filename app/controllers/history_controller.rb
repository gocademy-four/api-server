class HistoryController < ApplicationController
    def show

        if Customer.exists?(member_id: current_user.id)
            customer_id = Customer.find_by!(member_id: current_user.id).id
            orders = Order.where(customer_id: customer_id)
        else
            tutor_id = Tutor.find_by!(member_id: current_user.id).id
            teachedlesson_ids = Teachedlesson.where(tutor_id: tutor_id).ids
            orders = Order.where(teachedlesson_id: teachedlesson_ids)
        end

        render json: orders.map{ |order| order.as_json.merge({
            customer_name: order.customer.member.name,
            customer_phone_number: order.customer.member.phone_number,
            tutor_id: order.teachedlesson.tutor.member.id,
            tutor_name: order.teachedlesson.tutor.member.name,
            tutor_phone_number: order.teachedlesson.tutor.member.phone_number,
            lesson_id: order.teachedlesson.lesson.id,
            lesson_name: order.teachedlesson.lesson.name, 
            teachedlesson_id: order.teachedlesson.id,
            teachedlesson_price_per_hour: order.teachedlesson.price_per_hour,
            location: order.teachedlesson.tutor.member.city 
        })}
    end
end

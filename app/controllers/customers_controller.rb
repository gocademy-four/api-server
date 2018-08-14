class CustomersController < ApplicationController
  def show
    if params[:id] then
      customer = Customer.find_by!(id: params[:id])
    else
      customer = Customer.find_by!(id: current_user.id)
    end

    render json: customer.as_json.except("member_id").merge({
      member: customer.member.as_json.except("password_digest")
    })
  end
end

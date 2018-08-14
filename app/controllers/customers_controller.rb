require 'token_service'

class CustomersController < ApplicationController
  def show
    if params[:id] then
      customer = Customer.find_by!(member_id: params[:id])
    else
      customer = Customer.find_by!(member_id: current_user.id)
    end

    render json: customer.as_json.except("member_id").merge({
      member: customer.member.as_json.except("password_digest")
    })
  end

  def create
    customer = Customer.new
    customer.member = Member.new(params.require(:member).permit(
      :email, :name, :phone_number, :gender, :street, :city, :password
    ))
    customer.save!

    render json: {
      token: TokenService.issue(customer.member.id)
    }
  end
end

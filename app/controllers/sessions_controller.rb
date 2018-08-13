class SessionsController < ApplicationController
  def login
    params.require([:email, :password])

    email = params[:email]
    password = params[:password]

    member = Member.find_by!(email: email).authenticate(password)
    raise AbstractController::ActionNotFound if !member

    render json: { token: "TOKEN" }
  end
end

require 'token_service'

class SessionsController < ApplicationController
  def login
    params.require([:email, :password])

    email = params[:email]
    password = params[:password]

    member = Member.find_by!(email: email).authenticate(password)
    raise AbstractController::ActionNotFound unless member

    render json: { token: TokenService.issue(member.id) }
  end
end

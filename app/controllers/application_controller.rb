require 'token_service'

class ApplicationController < ActionController::API
  def current_user
    Member.find_by!(id: token)
  end

  private
  def token
    http_auth = request.env.fetch("HTTP_AUTHORIZATION", "")
    token_val = http_auth.scan(/^Bearer (.*)$/).flatten.last

    throw ActionController::BadRequest unless token_val
    TokenService.check(token_val)
  end
end

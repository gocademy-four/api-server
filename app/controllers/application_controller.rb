class ApplicationController < ActionController::API
  def current_user
    Member.find_by!(token)
  end

  private
  def token
    http_auth = request.env.fetch("HTTP_AUTHORIZATION", "")
    token_val = http_auth.scan(/^Bearer (.*)$/).flatten.last

    throw ActionController::BadRequest unless token_val
    token_val
  end
end

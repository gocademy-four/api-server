class SessionsController < ApplicationController
  def login
    params.require([:email, :password])
  end
end

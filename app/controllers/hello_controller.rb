class HelloController < ApplicationController
  def test
    render json: { this: "is an example of", ruby: "on rails" }
  end
end

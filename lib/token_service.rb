module TokenService
  extend self

  def build(payload)
    JWT.encode payload, secret, "HS256"
  end

  def check(token)
    JWT.decode(token, secret)[0]["sub"]
  end

  def issue(sub)
    build({
      exp: (Time.now + 1.month).to_i,
      sub: sub
    })
  end

  private
  def secret
    "my-secret"
  end
end

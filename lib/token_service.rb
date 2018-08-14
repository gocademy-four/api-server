module TokenService
  extend self

  def token_period
    1.day
  end

  def build(payload)
    JWT.encode payload, secret, "HS256"
  end

  def check(token)
    body = JWT.decode(token, secret)[0]

    iat_time = Time.at (body["nbf"] || body["iat"]).to_i
    exp_time = iat_time + token_period

    throw JWT::ExpiredSignature if Time.now > exp_time
    body["sub"]
  end

  def issue(sub)
    now = Time.now

    payload = {
      iat: now.to_i,
      exp: (now + 1.year).to_i,

      sub: sub
    }

    build(payload)
  end

  private
  def secret
    "my-secret"
  end
end

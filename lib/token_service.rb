module TokenService
  extend self

  def issue(sub)
    payload = {
      iat: Time.now,
      exp: 3.days.from_now,

      sub: sub
    }

    JWT.encode payload, nil, 'none'
  end

  def check(token)
  end
end

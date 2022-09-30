class JsonWebToken
  HMAC_SECRET = Rails.application.secrets.secret_key_base
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.encode(user_id)
    exp = 24.hours.from_now.to_i
    payload = { user_id:, exp: }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end

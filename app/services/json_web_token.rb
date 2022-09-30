
class JsonWebToken
    HMAC_SECRET = Rails.application.secrets.secret_key_base
    ALGORITHM_TYPE = 'HS256'.freeze

    def self.encode(user_id)
        exp = 24.hours.from_now.to_i
        payload = { user_id: user_id, exp: exp }
        JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
    end
  
    def self.decode(token)
        body = JWT.decode(token, JWT_SECRET)[0]
        HashWithIndifferentAccess.new body
      rescue JWT::ExpiredSignature, JWT::VerificationError => e
        raise ExceptionHandler::ExpiredSignature, e.message
      rescue JWT::DecodeError, JWT::VerificationError => e
        raise ExceptionHandler::DecodeError, e.message
      end

end 
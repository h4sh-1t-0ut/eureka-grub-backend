class User < ApplicationRecord
  has_many :recipes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def create_jwt
    # Set the expiration time for the token (e.g., 24 hours from now)
    expiration_time = 24.hours.from_now.to_i

    # Generate a unique JWT ID (jti)
    jti = SecureRandom.uuid

    # Create the token payload with the user ID, expiration time, and jti
    token_payload = { user_id: id, exp: expiration_time, jti: jti }

    # Get the secret key for signing the token
    secret_key = Rails.application.secrets.secret_key_base

    # Generate the JWT token
    token = JWT.encode(token_payload, secret_key, 'HS256')

    # Save the jti and expiration time to the denylist (token revocation)
    JwtDenylist.create(jti: jti, exp: Time.at(expiration_time))

    token
  
  end
end

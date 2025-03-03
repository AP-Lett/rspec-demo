class SessionsController < ApplicationController
  skip_before_action :authorize_request
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      # Add expiration time (e.g., 1 hour from now)
      expiration_time = 20.minutes.from_now.to_i
      payload = { user_id: user.id, exp: expiration_time }
      token = JWT.encode(payload, Rails.application.credentials.secret_key_base)

      render json: { jwt: token, exp: expiration_time, user: user }, status: :created
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # def create
  #   # Find the user by email
  #   user = User.find_by(email: params[:email])

  #   # Authenticate the user
  #   if user && user.authenticate(params[:password])
  #     # Generate a JWT token
  #     token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base)

  #     # Return the token in the response
  #     render json: { jwt: token, user: user }, status: :created
  #   else
  #     # Invalid credentials
  #     render json: { error: 'Invalid email or password' }, status: :unauthorized
  #   end
  # end
end

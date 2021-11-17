class Api::V1::SessionsController < ApplicationController
  def create
    user_info = JSON.parse(request.raw_post, symbolize_names: true)
    user = User.find_by(email: user_info[:email])
    if user && user.authenticate(user_info[:password])
        render json: UserSerializer.new(user), status: 201
    else
      render json: { errors: 'Password or email incorrect' }, status: :not_found
    end
  end
end

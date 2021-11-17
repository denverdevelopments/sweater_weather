class Api::V1::UsersController < ApplicationController
  # before_action :set_api_key
  before_action :generate_api_key

    def create
      # user = User.new(user_params)
      # if user.save
      #   user.update(api_key: @api_key)
      #   render json: UserSerializer.new(user), status: :created
      details = JSON.parse(request.raw_post, symbolize_names: true)
      details[:api_key] = @api_key
      user = User.new(details)
      if user.save
          render json: UserSerializer.user(user), status: 201
      else
        render json: { errors: 'Password error' }, status: :bad_request
      end
    end

    private

    # def set_api_key
    #   @api_key = generate_api_key
    # end

    # def user_params
    #   params.permit(:email, :password, :password_confirmation)
    # end

    def generate_api_key
      @api_key = SecureRandom.base64.tr('+/=', 'Qrt')
    end
end

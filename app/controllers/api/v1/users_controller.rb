class Api::V1::UsersController < ApplicationController
  before_action :set_api_key

    def create
      user = User.new(user_params)
      if user.save
        user.update(api_key: @api_key)
        render json: UserSerializer.new(user), status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :bad_request
      end
    end

    private

    def set_api_key
      @api_key = generate_api_key
    end

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end

    def generate_api_key
      SecureRandom.base58(24)
      # def generate_api_key
      #   loop do
      #     token = SecureRandom.base64.tr('+/=', 'Qrt')
      #     break token unless User.exists?(api_key: token).any?
      #   end
      # end
    end
end

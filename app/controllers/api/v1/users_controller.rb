class Api::V1::UsersController < ApplicationController
  before_action :generate_api_key

    def create
      details = JSON.parse(request.raw_post, symbolize_names: true)
      details[:api_key] = @api_key
      user = User.new(details)
      if user.save
          render json: UserSerializer.new(user), status: 201
      else
        render json: { errors: 'Password or email error' }, status: :bad_request
      end
    end

    private

    def generate_api_key
      @api_key = SecureRandom.base64.tr('+/=', 'Qrt')
    end
end

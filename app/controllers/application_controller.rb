class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :current_user

  # Setting up current user
  #
  def current_user
    # request.headers['access-token']
    @current_user ||= User.find_by(email: request.headers['uid'])
  end

  # Verify user signed in
  def user_signed_in_api?
    current_user_api.present?
  end

  # authenticate user with token if user is signed in
  # 
  def authenticate_with_token!
    unless user_signed_in_api?
      render json: { errors: 'Not authenticated' },
             status: :unathorized
    end
  end
end
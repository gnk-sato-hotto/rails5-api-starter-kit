class UserSessionsController < ApplicationController
  include Sorcery::Controller
  skip_before_action :login_required, only: [:create]

  def create
    if params[:user].nil?
      render json: {message: 'No email and password.'}, status: :bad_request
      return
    end

    if @user = login(login_user[:email], login_user[:password])
      api_key = @user.activate
      @access_token = api_key.access_token
      user = {
        id:    @user.id,
        name:  @user.name,
        email: @user.email,
        role_id: @user.role_id
      }
      render json: {user: user, token: @access_token}, status: :created
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    access_token = request.headers[:AUTHORIZATION]
    api_key = ApiKey.find_by_access_token(access_token)
    if api_key
      api_key.user.inactivate
      render(json: {}, status: :ok)
    end
  end

  # このメソッドがないと login メソッドでエラーになる
  def form_authenticity_token
  end

  private

    def login_user
      params[:user]
    end

end

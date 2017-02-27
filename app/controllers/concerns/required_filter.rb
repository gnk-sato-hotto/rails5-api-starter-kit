module RequiredFilter
  extend ActiveSupport::Concern
  
  ## login: ログインをしている
  def login_required
    access_token = request.headers[:AUTHORIZATION]
    return(render json: {}, status: :unauthorized) if !User.login?(access_token)
  end

end

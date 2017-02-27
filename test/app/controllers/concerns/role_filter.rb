module RoleFilter
  extend ActiveSupport::Concern

  ## 管理者フィルタ
  def admin_filter
    access_token = request.headers[:AUTHORIZATION]
    api_key = ApiKey.find_by_access_token(access_token)
    user = api_key.user 
    return(render json: {message: '管理者権限がありません'}, status: :forbidden)if user.role.name != 'admin'
  end

  ## OEM フィルタ
  def oem_filter
  end

  ## クライアントフィルタ
  def client_filter
  end

  ## ユーザフィルタ
  def user_filter
  end


end

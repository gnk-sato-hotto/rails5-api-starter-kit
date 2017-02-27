module RequiredFilter
  extend ActiveSupport::Concern
  
  ## login: ログインをしている
  def login_required
    access_token = request.headers[:AUTHORIZATION]
    return(render json: {}, status: :unauthorized) if !User.login?(access_token)
  end

  # ## session_required
  # 30分以上アクセスがない場合はセッション切れ
  def session_required
    if Sm.new(session).expired?
      Rails.logger.debug "==========session_required in application_controller==============="
      reset_session
      return render json: {message: "session timeout"}, status: 423
    end
  end

  # ## ip_required
  # 指定されたIPアドレス以外はアクセス禁止
  def ip_required
    if !Util.ip_check?($SYSTEM_ADMIN_IPS,request.remote_ip)
      return render json: {message: "not authenticated"}, status: 401
    end
  end

  # ## basic_required
  # アクセスするにはBasic認証が必要
  def basic_required
    authenticate_or_request_with_http_basic do |username, password|
      username=="ams" && password=="ams0123456"
    end
  end

  # ## system_basic_required
  # アクセスするにはBasic認証が必要
  def system_basic_required
    authenticate_or_request_with_http_basic do |username, password|
      username=="ams" && password=="ams0123456"
    end
  end


end

class ApplicationController < ActionController::API
  include RequiredFilter
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  #before_action :login_required
  #before_filter :basic

  private
  def basic
    authenticate_or_request_with_http_basic do |user, pass|
      user == 'tqnvh3bv' && pass == 'bfh4vsbdkcsmlcdb'
    end
  end

end

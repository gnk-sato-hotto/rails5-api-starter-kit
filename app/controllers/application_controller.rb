class ApplicationController < ActionController::API
  include RequiredFilter
  before_action :login_required

end

class CurrentUsersController < ApplicationController

  def find_one
    access_token = request.headers[:AUTHORIZATION]
    api_key = ApiKey.find_by_access_token(access_token)
    return(render json: {}, status: :unauthorized) if api_key.nil?
    
    current_user = CurrentUser.new({user_id: api_key.user_id})
    render json: current_user.as_json
  end

end

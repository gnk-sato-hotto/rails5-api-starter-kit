module ReqLimitFilter

  extend ActiveSupport::Concern

  def insert_req
    Req.where("created_at < '%s'", Time.now-1.minutes).delete_all
    if params[:mask_by]
      if Req.where("created_at >= '%s'",Time.now-1.minutes).count > 5
        render json: {message: "同時実行数を超えています"}, status: 429 
      else
        @req = Req.create(
          query: params,
          action_name: action_name,
          controller_name: controller_name,
          user_id: current_user.id,
          client_id: (current_client.id rescue nil)
        )
      end
    end
  end

  def destroy_req
    @req.delete if params[:mask_by]
  end

end

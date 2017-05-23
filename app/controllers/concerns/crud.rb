module Crud
  extend ActiveSupport::Concern

  # include時に呼ばれる
  included do
    #before_action :set_params_client_id,  only: [:create, :update]
    #before_action :set_params_shop_id,    only: [:create, :update]
    #before_action :set_params_user_id,    only: [:create, :update]
    before_action :find_one,              only: [:show,:update,:destroy]
    before_action :find_all,              only: [:index]
    # crudを生成
    crud controller_name.singularize.camelize.constantize
  end


  module ClassMethods

    def crud(clazz)

      table_name = clazz.to_s.tableize.gsub("/","_").to_sym
      model_name = clazz.to_s.underscore.gsub("/","_").to_sym
      
      # ### index
      #
      # clazz.search(params).result
      #
      #   ransackの記法で書いています
      #   検索オプションは以下です
      #
      #     * xxx_cont = ○○の文字を含む
      #
      #   https://github.com/ernie/ransack/wiki/Basic-Searching
      #
      # .page(params[:p]).per(100)
      #
      #   kaminariを利用しています
      #     p: ページ番号
      #     pp: 各ページに表示する件数
      #     o: オーダー
      #     https://github.com/amatsuda/kaminari
      #
      define_method :find_all do
        Rails.logger.debug "==========find_all==============="
        Rails.logger.debug params.inspect
        @page       = params[:p]  ? params[:p].to_i  : 1
        @per_page   = params[:pp] ? params[:pp].to_i : 100
        params[:s] ||= "id desc"
        params[:s] = params[:s].split(",").join(" ") rescue params[:s]
        instance_variable_set(
          "@#{table_name}",
          clazz.search(params).result.page(@page).per(@per_page)
        )
      end

      define_method :index do
        Rails.logger.debug "==========index==============="
        Rails.logger.info "total: #{instance_variable_get("@#{table_name}").total_count}, p: #{@page}, pp: #{@per_page}"
        render json: {
          data: instance_variable_get("@#{table_name}").as_json(params),
          total: instance_variable_get("@#{table_name}").total_count, 
          p: @page, 
          pp: @per_page
        }
      end

      # ### show 詳細表示
      define_method :show do
        render json: instance_variable_get("@#{model_name}").as_json(params) 
      end

      # ### create 作成
      define_method :create do
        Rails.logger.debug "===> create start "
        Rails.logger.debug "params #{model_name} #{clazz}, #{one_params}"
        instance_variable_set "@#{model_name}", clazz.new(one_params)
        Rails.logger.debug "@#{model_name}"


        if instance_variable_get("@#{model_name}").save
          render json: instance_variable_get("@#{model_name}"), status: :created #{status: :created, location: instance_variable_get("@#{model_name}")}
        else
          Rails.logger.debug instance_variable_get("@#{model_name}").errors.full_messages
          Rails.logger.debug instance_variable_get("@#{model_name}").errors.inspect
          render json: instance_variable_get("@#{model_name}").errors.full_messages, status: :unprocessable_entity 
        end
      end

      # ### update 更新
      define_method :update do
        Rails.logger.debug "update-------"
        Rails.logger.debug "Controller::Crud" + one_params.inspect.inspect
        Rails.logger.debug "update-------"
        if instance_variable_get("@#{model_name}").update one_params
          render json: instance_variable_get("@#{model_name}")
        else
          Rails.logger.debug instance_variable_get("@#{model_name}").errors.full_messages
          Rails.logger.debug instance_variable_get("@#{model_name}").errors.inspect
          render json: instance_variable_get("@#{model_name}").errors.full_messages, status: :unprocessable_entity 
        end
      end

      define_method :destroy do
        instance_variable_get("@#{model_name}").destroy
        head :no_content
      end

      define_method :options do
      end

      define_method :find_one do
        instance_variable_set "@#{model_name}", clazz.find_one(params)
      end

      define_method :one_params do
        params.require(model_name).permit(*clazz.attribute_names)
      end

      define_method :filter_one do
        if instance_variable_get("@#{model_name}").present? && c_id = instance_variable_get("@#{model_name}").client_id
          return render json: {}, status: 403 unless current_user.my_clients? c_id
          return render json: {}, status: 403 unless current_client.id == c_id
        end
      end
    end

  end


end

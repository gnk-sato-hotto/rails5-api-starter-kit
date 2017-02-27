module FindDefault
  extend ActiveSupport::Concern

  included do
    # 一覧用のscope
    scope :find_all, ->(params){}
  end

  module ClassMethods
    # 詳細用のfind
    def find_one params
      find params[:id]
    end
  end

end

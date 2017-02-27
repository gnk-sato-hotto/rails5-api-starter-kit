module FindDefault
  extend ActiveSupport::Concern

  included do
    scope :find_all, ->(params){}
  end

  module ClassMethods
    def find_one params
      find params[:id]
    end
  end

end

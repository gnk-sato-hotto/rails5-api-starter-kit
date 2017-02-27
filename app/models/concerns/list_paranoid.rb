# ListParanoid 
module ListParanoid
  extend ActiveSupport::Concern

  included do
    acts_as_paranoid
  end

  module InstanceMethods
    # ## scope_condition
    # acts_as_listのメソッドで、内部で呼ばれているメソッド
    # acts_as_listとacts_as_paranoidの組み合わせ対応
    def scope_condition
      super.where(:deleted_at => nil)
    end
  end

end

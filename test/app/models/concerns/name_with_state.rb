
# 状態つき名前
module NameWithState
  extend ActiveSupport::Concern

  def name_with_state
    name = self.name rescue ""
    if self.state == "pending"
      name = '(停止中)' + name
    end
    name
  end
end


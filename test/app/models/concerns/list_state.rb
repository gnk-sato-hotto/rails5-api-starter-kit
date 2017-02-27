# ListState
module ListState
  extend ActiveSupport::Concern

  included do
    before_update :set_position_nil
  end

  def set_position_nil
    # pendingかどうかが変わったらpositionリセット
    if self.state_was == "pending"
      self.position = nil if self.state_changed?
    elsif self.state == "pending"
      self.position = nil 
    end
  end

end

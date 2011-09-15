class UserActivityship < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  def is_owner
    self.owner = true
  end
end

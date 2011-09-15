class Activity < ActiveRecord::Base

  has_many :user_activityships
  has_many :users, :through => :user_activityships

  cattr_reader :per_page
  @@per_page = 10
  attr_reader :owners, :joiners

  validates :title, :presence => true
  validates :synopsis, :presence => true
  validates :description, :presence => true


  def owner
    unless self.user_activityships.find_by_owner(true).nil?
      owner_id = self.user_activityships.find_by_owner(true).user_id
      @owners = self.users.find_all_by_id(owner_id)
    else
      nil
    end

  end

  def owner=(*user)
    self.user_activityships.find_by_user_id(user.id).update_attribute(:owner, true)
  end

  def joiner
    unless self.owner.nil?
      @joiners = self.users - self.owner
    else 
      @joiners = self.users
    end
  end
end

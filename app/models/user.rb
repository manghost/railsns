require 'digest/sha2'

class User < ActiveRecord::Base
  attr_protected :hashed_password, :enabled
  attr_accessor :password

  validates :username, 
            :presence =>true,
            :length => { :in => 3..64 },
            :uniqueness => { :case_sensitive => false }
  validates :email,
            :presence => true,
            :length => { :in => 5..128 },
            :uniqueness => { :case_sensitive => false }
  validates :password,
            :confirmation => true,
            :presence => true,:if => :password_required?,
            :length => { :in => 4..20 }
  validates :profile,
            :length =>{ :maxnum => 1000}

  has_and_belongs_to_many :roles
  has_many :articles
  has_many :user_activityships
  has_many :activities, :through => :user_activityships

  before_save :hash_password_save

  def hash_password_save
    self.hashed_password = User.encrypt(password) if !password.blank?
  end

  def password_required?
    hashed_password.blank? || !password.blank?
  end

  def self.encrypt(string)
    return Digest::SHA256.hexdigest(string)
  end
  
  def self.authenticate(username, password)
    find_by_username_and_hashed_password_and_enabled(username, 
        User.encrypt(password), true)
  end
  
  def has_role?(rolename)
    self.roles.find_by_name(rolename) ? true : false
  end
end

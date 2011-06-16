class Category < ActiveRecord::Base
  has_many :articles, :dependent => :nullify
  validates_length_of :name, :within => 3..64
end

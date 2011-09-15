class Article < ActiveRecord::Base
  before_save :update_published_at

  belongs_to :user
  belongs_to :category

  validates :title, :presence => true,
    :length => {  :minimum => 1,:maxmun => 255}
  validates :synopsis, :presence => true,
    :length => {  :minimum => 1,:maxmun => 1000}
  validates :title, :presence => true,
    :length => { :minimum => 1, :maxmun => 20000}

  cattr_reader :per_page
  @@per_page = 5
  
  def update_published_at
    self.published_at = Time.now if published == true
  end
end

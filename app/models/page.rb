class Page < ActiveRecord::Base
before_create :to_permalink

 validates :title, :presence => true,
                    :length => { :minimum => 3, :maxmun => 255}

 validates :body, :presence => true

# def self.before_create
#    @attributes['permalink'] = title.downcase.gsub(/\s+/, '_').gsub(/[^\w]+/, '')
#  end

#before_create :permalink  这个方法可以“假装”修改以前的permalink的值，比较实用但是修改的话，还是用to_permalink吧。。。
#  def permalink
#    @attributes['permalink'] = title.downcase.gsub(/\s+/, '_').gsub(/[^\w]+/, '')
#    title.downcase.gsub(/\s+/, '_').gsub(/[^\w]+/, '') 调用方法时返回一个值，在视图中直接被用到，所以可以掩盖以前的失误。。
#  end
  def to_permalink
    @attributes['permalink'] =title.downcase.gsub(/\s+/, '_').gsub(/[^\w]+/, '')
#  @permalink  =title.downcase.gsub(/\s+/, '_').gsub(/[^\w]+/, '') 错误用法！
  end


 def to_param
    "#{id}-#{permalink}"
 end
  
end

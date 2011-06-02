class Page < ActiveRecord::Base


 validates :title, :presence => true,
                    :length => { :minimum => 3, :maxmun => 255}

 validates :body, :presence => true

 def before_create
    @attributes['permalink'] =
      title.downcase.gsub(/\s+/, '_').gsub(/[^\w]+/, '')
  end

 def to_param
    "#{id}-#{permalink}"
 end
  
end

class Banner < ActiveRecord::Base
  attr_accessible :title, :body
  
  validates :title, :body, :presence => true

end

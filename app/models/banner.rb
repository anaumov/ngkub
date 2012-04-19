class Banner < ActiveRecord::Base
  attr_accessible :title, :body
  
  validates :title, :body, :presence => true
  belongs_to :user
end

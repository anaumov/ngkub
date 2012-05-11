class Banner < ActiveRecord::Base
  attr_accessible :title, :body, :publish, :place
  
  validates :title, :body, :presence => true
  belongs_to :user
end

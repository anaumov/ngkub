class Tele < ActiveRecord::Base
  attr_accessible :title, :body, :slug, :intro
  
  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 3 } 

  has_many :comments, :as => :commentable
end

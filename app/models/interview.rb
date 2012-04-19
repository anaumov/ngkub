class Interview < ActiveRecord::Base
  attr_accessible :title, :body, :slug, :intro
  
  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 3 } 
  validates :body,  :length => { :minimum => 20 } 

  has_many :question
  has_many :comments, :as => :imageable
  belongs_to :user
  

end

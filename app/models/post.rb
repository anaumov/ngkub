class Post < ActiveRecord::Base
  attr_accessible :title, :body, :publish

  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 3 } 
  validates :body,  :length => { :minimum => 20 } 

  has_many :comments, :as => :commentable
  belongs_to :user

end

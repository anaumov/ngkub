class Complaint < ActiveRecord::Base
  attr_accessible :title, :body, :user_name, :user_contacts, :replay

  validates :user_name, :title, :body, :user_contacts, :presence => true
  validates :title, :user_contacts, :length => { :minimum => 3 } 
  validates :body,  :length => { :minimum => 20, :maximum => 500 } 

  has_many :comments, :as => :commentable

end

class Question < ActiveRecord::Base
  attr_accessible :body
  
  validates :body, :presence => true
  validates :body,  :length => { :minimum => 5 } 
  
  belongs_to :interview
  has_one :answer

end

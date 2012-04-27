class Question < ActiveRecord::Base
  attr_accessible :body, :autor, :interview_id
  
  validates :body, :autor, :presence => true
  validates :body,  :length => { :minimum => 5 } 
  
  belongs_to :interview
  has_one :answer

end

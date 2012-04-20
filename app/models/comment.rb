class Comment < ActiveRecord::Base
  attr_accessible :body, :commentable_id, :commentable_type
  
  validates :body, :presence => true
  
  belongs_to :commentable, :polymorphic => true
  
end

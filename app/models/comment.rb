class Comment < ActiveRecord::Base
  attr_accessible :body, :commentable_id, :commentable_type, :autor, :created_at
  
  validates :body, :autor, :presence => true
  
  belongs_to :commentable, :polymorphic => true
  
end

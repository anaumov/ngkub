class Comment < ActiveRecord::Base
  apply_simple_captcha

  attr_accessible :body, :commentable_id, :commentable_type, :autor, :created_at
  
  validates :body, :autor, :presence => true
  
  belongs_to :commentable, :polymorphic => true
  
end

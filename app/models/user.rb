class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :about, :user_pic
  
  validates :email, :first_name, :presence => true

  has_many :publications
end

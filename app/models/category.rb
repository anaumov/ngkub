class Category < ActiveRecord::Base
  attr_accessible :title, :slug, :intro
  
  validates :title, :slug, :presence => true
  validates :title, :length => { :minimum => 3 } 

end

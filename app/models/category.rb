class Category < ActiveRecord::Base
  attr_accessible :title, :slug, :intro
  
  validates :title, :slug, :presence => true
  validates :title, :length => { :minimum => 3 } 

  has_many :commrents, :as => :imageable
  has_many :publications

end

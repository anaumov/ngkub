class Category < ActiveRecord::Base
  attr_accessible :title, :slug, :intro
  
  validates :title, :presence => true
  validates :slug, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :title, :length => { :minimum => 3 } 

  has_many :commrents, :as => :imageable
  has_many :publications

  def to_param
   slug
  end

end

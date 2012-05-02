class Publication < ActiveRecord::Base

  attr_accessible :title, :body, :slug, :intro, :category, :category_id, :newspic, :onmain
  has_attached_file :newspic, :styles => { :medium => "610x400", :thumb => "185x125" }
  
  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 3 } 
  validates :body,  :length => { :minimum => 20 } 

  has_many :comments, :as => :commentable
  belongs_to :category
end

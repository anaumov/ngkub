class Tele < ActiveRecord::Base
  attr_accessible :title, :body, :slug, :intro, :telepic, :publish, :youtube
  has_attached_file :telepic, :styles => { :medium => "610x400", :one => "200x200#", :two => "100x100#", :three => "50x50#" }
  
  validates :title, :body, :presence => true
  validates :slug, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :title, :length => { :minimum => 3 } 

  has_many :comments, :as => :commentable

  def to_param
   slug
  end
end

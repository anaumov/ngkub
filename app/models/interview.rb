class Interview < ActiveRecord::Base
  attr_accessible :title, :body, :slug, :intro, :openquest, :pubdate, :questpub, :personpic, :publish
  has_attached_file :personpic, :styles => { :medium => "610x400", :thumb => "88x88#" }
  
  validates :title, :body, :presence => true
  validates :slug, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :title, :length => { :minimum => 3 } 
  validates :body,  :length => { :minimum => 20 } 

  has_many :comments, :as => :commentable
  has_many :question
  belongs_to :user

  def to_param
   slug
  end
  

end

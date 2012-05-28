class Publication < ActiveRecord::Base

  attr_accessible :title, :body, :slug, :intro, :category, :category_id, :newspic, :onmain, :created_at, 
                  :publish, :old_id, :issue

  has_attached_file :newspic, :styles => { :medium => "537x358#", :thumb => "185x125"}
  
  validates :title, :body, :presence => true
  validates :slug, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :title, :length => { :minimum => 3 } 
  validates :body,  :length => { :minimum => 20 } 

  has_many :comments, :as => :commentable
  belongs_to :category

  define_index do
    # fields
    indexes title
    indexes body
    
    # attributes
    has created_at
  end

  def to_param
   slug
  end
 
end

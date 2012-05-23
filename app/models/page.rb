class Page < ActiveRecord::Base
  attr_accessible :title, :body, :slug, :publish
  validates :title, :body, :presence => true
  validates :slug, :presence => true, :uniqueness => { :case_sensitive => false }

  def to_param
   slug
  end
end

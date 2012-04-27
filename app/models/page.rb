class Page < ActiveRecord::Base
  attr_accessible :title, :body, :slug
  validates :title, :body, :slug, :presence => true
end

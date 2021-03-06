class Publication < ActiveRecord::Base
attr_accessible :title, :body, :slug, :intro, :category, :category_id, :newspic, :onmain, :created_at, 
                  :publish, :old_id, :issue, :published_on

  has_attached_file :newspic, :styles => { :medium => "537x358#", :thumb => "185x125"}, :default_url => "/assets/missing.png" 

  
  validates :title, :body, :presence => true
  validates :slug, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :title, :length => { :minimum => 3 } 
  validates :body,  :length => { :minimum => 20 } 

  has_many :comments, :as => :commentable
  belongs_to :category
  after_create :set_published

  scope :this_month, where(published_on: [Date.today.at_beginning_of_month..Date.today.at_end_of_month])
  scope :month, lambda{|day| where(published_on: [day.at_beginning_of_month..day.at_end_of_month])}

  def to_param
   slug
  end

  #TODO вынести в scope
  def self.get_related(publication)
    Publication.find(:all, :conditions => ['publish = ? AND id != ?', true, publication.id], :order => "created_at DESC", :limit => 5)
  end
  
  def self.onmain
    Publication.find(:all, :conditions => ['publish = ?', true], :order => "created_at desc", :limit => 1).last
  end
  
  def self.indexpubs
    Publication.find(:all, :conditions => ['publish = ?', true], :order => "created_at DESC", :offset => 1, :limit => 10)
  end

  def self.slider_pubs
    Publication.where(:onmain => true, :publish => true)
  end

private
  def set_published
    self.update_attribute(:published_on, created_at.to_date)
  end

 
end

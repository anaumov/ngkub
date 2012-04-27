class PagesController < ApplicationController

  def indexpage
    @day_hero = Hero.last

    @main_theme = Publication.last
    @slider_pubs = Publication.where(:onmain => true)
    @index_publications = Publication.find(:all, :order => "id desc", :offset => 1, :limit => 10)
    
    @index_interviews = Interview.find(:all, :order => "id desc", :limit => 3)
    @last_comments = Comment.find(:all, :order => "id desc", :limit => 5)
  end

end

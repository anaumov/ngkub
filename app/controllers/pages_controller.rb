class PagesController < ApplicationController

  def indexpage
    @day_hero = Hero.last

    @main_theme = Publication.last
    @slider_pubs = Publication.where(:onmain => true)
    @index_publications = Publication.find(:all, :order => "id desc", :offset => 1, :limit => 10)
    
    @index_interviews = Interview.find(:all, :order => "id desc", :limit => 3)
    @last_comments = Comment.find(:all, :order => "id desc", :limit => 5)
  end

  def create
    @page = Page.create(params[:page])

    if @page
      redirect_to pages_path
    else
      render :new
    end  
  end

  def new
    @page = Page.new
  end
  
  def show
    @page = Page.where(:id => params[:id]).first
    unless @page  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @pages = Page.all
    unless @pages
      flash[:notice] = "No Pages found"
    end 
  end

  def delete
    begin  
      page = Page.where(:id => params[:id]).first
    rescue  
      flash[:notice] = "we haven't Page with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
    
    unless page
      flash[:notice] = "Page " + page.title + " deleted"
      render :index  
    end  
  end

  def edit
    begin  
      @page = Page.find(params[:id])
    rescue  
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end
  end

  def update
    @page = Page.find(params[:id])
    
    if @page.update_attributes(params[:page])
      redirect_to @page
    else
      render :edit
    end
  end

end

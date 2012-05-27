class PagesController < ApplicationController
  before_filter :check_user, :only => [:new, :create, :edit, :update]

  def indexpage
    @day_hero = Hero.last

    @main_theme = Publication.find(:all, :conditions => ['publish = ?', true], :order => "created_at desc", :limit => 1).last
    @slider_pubs = Publication.where(:onmain => true, :publish => true)
    @index_publications = Publication.find(:all, :conditions => ['publish = ?', true], :order => "created_at DESC", :offset => 1, :limit => 10)
    @index_interviews = Interview.find(:all, :conditions => ['publish = ?', true], :order => "id desc", :limit => 3)
    @last_comments = Comment.find(:all, :order => "id desc", :limit => 5)
    @teles = Tele.find(:all, :conditions => ['publish = ?', true], :order => "id desc", :limit => 13)
    @tweets = Twitter.user_timeline("varlamov", :count =>5)
  end

  def create
    @page = Page.create(params[:page])

    if @page.errors.empty?
      redirect_to pages_path
    else
      render :new
    end  
  end

  def new
    @page = Page.new
  end
  
  def show
    @page = Page.find_by_slug(params[:id])
    check_publish(@page)
    unless @page  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    unless current_user and current_user.admin?
      redirect_to('/')
      return
    end
    @pages = Page.all
    unless @pages
      flash[:notice] = "No Pages found"
    end 
  end

  def destroy
    page = Page.where(:id => params[:id]).first
    if page
      flash[:notice] = "Page " + page.title + " deleted"
      redirect_to pages_path
    else
      flash[:notice] = "we haven't Page with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
  end

  def edit
    @page = Page.find_by_slug(params[:id])
  end

  def update
    @page = Page.find_by_slug(params[:id])
    
    if @page.update_attributes(params[:page])
      redirect_to @page
    else
      render :edit
    end
  end

end

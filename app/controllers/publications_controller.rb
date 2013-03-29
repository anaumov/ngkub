class PublicationsController < ApplicationController

  before_filter :check_user, :only => [:new, :create, :edit, :update, :import]
  require 'csv'
  #caches_action :show
  cache_sweeper :publication_sweeper

  def create
    @publication = Publication.create(params[:publication])

    if @publication.errors.empty?
      redirect_to publications_path
    else
      render :new
    end  
  end

  def new
    @publication = Publication.new
    @categories  = Category.all
  end

  def show
    @publication  = Publication.find_by_slug(params[:id])
    return render_404 unless @publication  

    check_publish(@publication)
    @comment = Comment.new unless @comment
  end

  def index
    if params[:date]
      @publications = Publication.where(published_on: params[:date], category_id: params[:category_id]).paginate(:page => params[:page], :order => "created_at DESC")    
    else
      @publications = Publication.paginate(page: params[:page], order: "created_at DESC")
    end
  end

  def destroy
    @publication = Publication.find_by_slug(params[:id])

    if @publication 
      flash[:notice] = "Publication " + @publication.title + " deleted"
      @publication.destroy
      redirect_to publications_path
    else
      render_404
    end  
  end

  def edit
     @categories = Category.all
     unless @publication = Publication.find_by_slug(params[:id])
        render_404
     end
  end

  def update
    @publication = Publication.find_by_slug(params[:id])
    
    if @publication.update_attributes(params[:publication])
      redirect_to @publication
    else
      render :edit
    end
  end

  def rss
    @publication = Publication.find(:all, :order => "id DESC", :limit => 20)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def archive
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @news_by_date = Publication.month(@date).all.group_by(&:published_on)
  end

end

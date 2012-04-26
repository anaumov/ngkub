class PublicationsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :edit]

  def create
    @publication = Publication.create(params[:publication])

    if @publication
      redirect_to publication_path
    else
      render :new
    end  
  end

  def new
    @publication = Publication.new
    @categories  = Category.all
  end
  

  def show
    @publication = Publication.where(:id => params[:id]).first
    @comment     = Comment.new
    unless @publication  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @publications = Publication.all
    unless @publications
      flash[:notice] = "No publications found"
    end 
  end

  def delete
    begin  
      pub = Publication.where(:id => params[:id]).first
    rescue  
      flash[:notice] = "we haven't Publication with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
    
    unless pub
      flash[:notice] = "Publication " + pub.title + " deleted"
      cat.destroy
      render :index  
    end  
  end

  def edit
     @categories = Category.all
    begin  
      @publication = Publication.find(params[:id])
    rescue  
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end
  end

  def update
    @publication = Publication.find(params[:id])
    @categories = Category.all
    
    if @publication.update_attributes(params[:publication])
      redirect_to @publication
    else
      render :edit
    end
  end

end

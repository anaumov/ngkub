class PublicationsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :edit]

  def create
    @pub = Publication.new(params[:publication])

    if @pub.save
      redirect_to publication_path
    else
      render :new
    end  
  end

  def new
    @pub = Publication.new
    @cats = Category.all
  end
  

  def show
    @pub     = Publication.where(:id => params[:id]).first
    @comment = Comment.new
    unless @pub  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @pubs = Publication.all
    unless @pubs
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
     @cats = Category.all
    begin  
      @pub = Publication.find(params[:id])
    rescue  
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end
  end

  def update
    @pub = Publication.find(params[:id])
    @cats = Category.all
    
    if @pub.update_attributes(params[:publication])
      redirect_to @pub
    else
      render :edit
    end
  end

end

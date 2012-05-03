class PublicationsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]

  def create
    @publication = Publication.create(params[:publication])
    p @publication.errors
    if @publication
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
    @publication = Publication.where(:id => params[:id]).first
    @comment     = Comment.new
    unless @publication  
       render_404
       return    
    end 
  end

  def index
    @publications = Publication.all
    unless @publications
      flash[:notice] = "No publications found"
    end 
  end

  def destroy
    begin  
      pub = Publication.where(:id => params[:id]).first
    rescue  
      flash[:notice] = "we haven't Publication with id=" + params[:id]
      render_404
    end 
    
    if pub
      flash[:notice] = "Publication " + pub.title + " deleted"
      pub.destroy
      render :index  
    end  
  end

  def edit
     @categories = Category.all
    begin  
      @publication = Publication.find(params[:id])
    rescue  
      render_404
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

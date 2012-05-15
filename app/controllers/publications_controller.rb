class PublicationsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]

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
    @publication  = Publication.where(:id => params[:id]).first

    @related_pubs = @publication.category.publications    
    @comment      = Comment.new
    
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
    @publication = Publication.where(:id => params[:id]).first

    if @publication 
      flash[:notice] = "Publication " + @publication.title + " deleted"
      @publication.destroy
      render :index  
    else
      flash[:notice] = "we haven't Publication with id=" + params[:id]
      render_404
    end  
  end

  def edit
     @categories = Category.all
     unless @publication = Publication.where(:id => params[:id]).first
        render_404
     end
  end

  def update
    @publication = Publication.find(params[:id])
    
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

end

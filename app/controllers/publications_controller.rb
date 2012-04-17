class PublicationsController < ApplicationController

  def create
    @cat = Category.find(params[:publication][:category_id])
    
    @pub = Publication.new(params[:publication], :category => @cat )

    if @pub.save
      redirect_to publications_path
    else
      render :new
    end  
  end

  def new
    @pub = Publication.new
    @cats = Category.all
  end
  

  def show
    @pub = Publication.where(:id => params[:id]).first

   
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
      cat = Publication.where(:id => params[:id]).first
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
    @cat = Category.find(params[:publication][:category_id])
    
    if @pub.update_attributes(params[:publication], :category => @cat )
      redirect_to @pub
    else
      render :edit
    end
  end

end

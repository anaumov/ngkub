class TelesController < ApplicationController
  before_filter :check_user, :only => [:new, :create, :edit, :update]
  def create
    @tele = Tele.create(params[:tele])

    if @tele.errors.empty?
      redirect_to teles_path
    else
      render :new
    end  
  end

  def new
    @tele = Tele.new
  end
  

  def show
    @tele    = Tele.find_by_slug(params[:id])
    check_publish(@tele)
    @comment = Comment.new
    unless @tele  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @teles = Tele.paginate(:page => params[:page], :order => "created_at")
    unless @teles
      flash[:notice] = "No programms found"
    end 
  end

  def destroy
    tele = Tele.find_by_slug(params[:id])
    if tele
      flash[:notice] = "Programm " + tele.title + " deleted"
      tele.destroy
      redirect_to teles_path 
    else
      flash[:notice] = "we haven't progremms with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
    
  end

  def edit
    @tele = Tele.find_by_slug(params[:id])
  end

  def update
    @tele = Tele.find_by_slug(params[:id])
    if @tele.update_attributes(params[:tele])
      redirect_to @tele
    else
      render :edit
    end
  end
end

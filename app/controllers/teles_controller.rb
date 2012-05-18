class TelesController < ApplicationController
  def create
    @tele = Tele.create(params[:tele])

    if @tele
      redirect_to teles_path
    else
      render :new
    end  
  end

  def new
    @tele = Tele.new
  end
  

  def show
    @tele    = Tele.where(:id => params[:id]).first
    @comment = Comment.new
    unless @tele  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @teles = Tele.all
    unless @teles
      flash[:notice] = "No programms found"
    end 
  end

  def destroy
    tele = Tele.where(:id => params[:id]).first
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
    @tele = Tele.find(params[:id])
  end

  def update
    @tele = Tele.find(params[:id])
    
    if @tele.update_attributes(params[:tele])
      redirect_to @tele
    else
      render :edit
    end
  end
end

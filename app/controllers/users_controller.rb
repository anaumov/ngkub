class UsersController < ApplicationController

  def create
    @user = User.create(params[:user])
    if @user.errors.empty?
      redirect_to users_path
    else
      render :new
    end  
  end

  def new
    @user = User.new
  end
  

  def show
   @user = User.where(:id => params[:id]).first
   unless @user  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @users = User.all
    unless @users
      flash[:notice] = "No heroes found"
    end 
  end

  def delete
      user = User.where(:id => params[:id]).first
    if user
      flash[:notice] = "user " + user.email + " deleted"
      user.destroy
      redirect_to "/adminka"
    else    
      flash[:notice] = "we haven't hero with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
      return
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user] )
      redirect_to users_path
    else
      render :edit
    end
  end
  

end

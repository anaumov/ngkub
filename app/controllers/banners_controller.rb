class BannersController < ApplicationController
  before_filter :check_user, :only => [:new, :create, :edit, :update, :index,:show]
  cache_sweeper :banner_sweeper

  def create
    expire_action :controller => :pages, :action => :indexpage
    @banner = Banner.create(params[:banner])

    if @banner
      redirect_to banners_path
    else
      render :new
    end  
  end

  def new
    @banner = Banner.new
  end
  

  def show
    @banner = Banner.where(:id => params[:id]).first
    unless @banner  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @banners = Banner.all
    unless @banners
      flash[:notice] = "No banners found"
    end 
  end

  def destroy
    banner = Banner.where(:id => params[:id]).first
    if banner
      flash[:notice] = "category " + banner.title + " deleted"
      banner.destroy
      banners_path 
    else  
      flash[:notice] = "we haven't category with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
  end

  def edit
    begin  
      @banner = Banner.find(params[:id])
    rescue  
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end
  end

  def update
    expire_action :controller => :pages, :action => :indexpage
    @banner = Banner.find(params[:id])
    
    if @banner.update_attributes(params[:banner])
      redirect_to @banner
    else
      render :edit
    end
  end

end

class CategoriesController < ApplicationController

  def create
    @cat = Category.new(params[:category])

    if @cat.save
      redirect_to categories_path
    else
      render :new
    end  
  end

  def new
    @cat = Category.new
  end
  

  def show
    @cat = Category.where(:id => params[:id]).first
    
    unless @cat  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @cats = Category.all
    unless @cats
      flash[:notice] = "No categories found"
    end 
  end

  def delete
    begin  
      cat = Category.where(:id => params[:id]).first
    rescue  
      flash[:notice] = "we haven't category with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
    
    unless cat
      flash[:notice] = "category " + cat.title + " deleted"
      cat.destroy
      render :index  
    end  
  end

  def edit
    begin  
      @cat = Category.find(params[:id])
    rescue  
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end
  end

  def update
    @cat = Category.find(params[:id])
    
    if @cat.update_attributes(params[:category])
      redirect_to @cat
    else
      render :edit
    end
  end
  
end

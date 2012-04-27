class CategoriesController < ApplicationController

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to categories_path
    else
      render :new
    end  
  end

  def new
    @category = Category.new
  end
  

  def show
    @category = Category.where(:id => params[:id]).first
    
    unless @category  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @categories = Category.all
    unless @categories
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
      @category = Category.find(params[:id])
    rescue  
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end
  end

  def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(params[:category])
      redirect_to categories_path
    else
      render :edit
    end
  end
  
end

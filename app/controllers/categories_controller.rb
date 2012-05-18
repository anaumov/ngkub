class CategoriesController < ApplicationController

  def create
    @category = Category.create(params[:category])

    if @category
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
    @publications = @category.publications
    unless @category  
       render_404
       return    
    end 
  end

  def index
    @categories = Category.all
    unless @categories
      flash[:notice] = "No categories found"
    end 
  end

  def destroy
    cat = Category.where(:id => params[:id]).first
    if cat
      flash[:notice] = "category " + cat.title + " deleted"
      cat.destroy
      redirect_to "/adminka" 
    else  
      flash[:notice] = "we haven't category with id=" + params[:id]
      render_404
      return
    end 
  end

  def edit
    begin  
      @category = Category.find(params[:id])
    rescue  
      render_404
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

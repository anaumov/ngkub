class CategoriesController < ApplicationController
  before_filter :check_user, :only => [:new, :create, :edit, :update]

  def create
    @category = Category.create(params[:category])

    if @category.errors.empty?
      redirect_to categories_path
    else
      render :new
    end  
  end

  def new
    @category = Category.new
  end
  
  def show
    @category = Category.find_by_slug(params[:id])
    @publications = @category.publications.paginate(:page => params[:page], :order => "created_at DESC")

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
    cat = Category.find_by_slug(params[:id])
    if cat
      flash[:notice] = "category " + cat.title + " deleted"
      cat.destroy
      redirect_to "/adminka" 
    else  
      render_404
      return
    end 
  end

  def edit
    @category = Category.find_by_slug(params[:id])
    unless @category  
      render_404
    end
  end

  def update
    @category = Category.find_by_slug(params[:id])
    
    if @category.update_attributes(params[:category])
      redirect_to categories_path
    else
      render :edit
    end
  end
  
end

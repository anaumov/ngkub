class CategoryController < ApplicationController

  def new
    cat = Category.new(params[:category])
    cat.save
  end
  
  def show
    cat = Category.find(params[:category][:id])    
  end

  def delete
    cat = Category.find(params[:category][:id])
    cat.destroy    
  end

  def edit
    cat = Category.find(params[:category][:id])
  end
  
end

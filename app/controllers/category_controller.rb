class CategoryController < ApplicationController

  def new
    @cat = Category.new(params[:category])

    if @cat.save
      redirect_to @cat
    else
      render :action =>:new
    end  
  end
  
  def show
    @cat = Category.find(params[:id])

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @cat }
    end
  end

  def index
    @cats = Category.all    
  end

  def delete
    cat = Category.find(params[:category][:id])
    cat.destroy    
  end

  def edit
    cat = Category.find(params[:category][:id])
  end
  
end

class CategoryController < ApplicationController

  def new
    @cat = Category.new(params[:category])

    if @cat.save
      redirect_to @cat
    else
      render :new
    end  
  end
  
  def show
    begin  
      @cat = Category.find(params[:id])
    rescue  
#      redirect_to("#{Rails.root}/public/404.html") 
#      render :file => "#{Rails.root}/public/404.html"
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
#      render :file => "/home/alex/Desktop/ruby/ngkub/public/404.html", :layout => true, :status => 404
    end 
  end

  def index
    @cats = Category.all
    if @cats.nil?
      flash[:notice] = "No categories found"
    end 
  end

  def delete
    begin  
      cat = Category.find(params[:id])
    rescue  
      flash[:notice] = "we haven't category with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
    
    if !(cat.nil?)
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

class HerosController < ApplicationController

 def create
    @hero = Hero.new(params[:hero])

    if @hero.save
      redirect_to heroes_path
    else
      render :new
    end  
  end

  def new
    @hero = Hero.new
  end
  

  def show
    @hero = Hero.where(:id => params[:id]).first
    @parent = @hero
   unless @hero  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @heroes = Hero.all
    
    unless @heroes
      flash[:notice] = "No heroes found"
    end 
  end

  def delete
    begin  
      hero = Hero.where(:id => params[:id]).first
    rescue  
      flash[:notice] = "we haven't hero with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
    
    unless hero
      flash[:notice] = "hero " + hero.title + " deleted"
      cat.destroy
      render :index  
    end  
  end

  def edit
    begin  
      @hero = Hero.find(params[:id])
    rescue  
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end
  end

  def update
    @hero = Hero.find(params[:id])
    
    if @hero.update_attributes(params[:hero] )
      redirect_to @hero
    else
      render :edit
    end
  end

end

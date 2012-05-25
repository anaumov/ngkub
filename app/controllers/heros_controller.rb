class HerosController < ApplicationController
 before_filter :check_user, :only => [:new, :create, :edit, :update]
 def create
    @hero = Hero.create(params[:hero])
    if @hero.errors.empty?
      redirect_to heros_path
    else
      render :new
    end  
  end

  def new
    @hero = Hero.new
  end
  

  def show
    @hero = Hero.find_by_slug(params[:id])
    check_publish(@hero)
    @comment = Comment.new
   unless @hero  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @heroes = Hero.paginate(:page => params[:page])
    unless @heroes
      flash[:notice] = "No heroes found"
    end 
  end

  def destroy
    hero = Hero.find_by_slug(params[:id])
    if hero
      flash[:notice] = "hero " + hero.title + " deleted"
      cat.destroy
      redirect_to heros_path
    else  
      render_404
    end 
    
  end

  def edit
    @hero = Hero.find_by_slug(params[:id])
    unless @hero  
      render_404
    end
  end

  def update
    @hero = Hero.find_by_slug(params[:id])
    
    if @hero.update_attributes(params[:hero] )
      redirect_to @hero
    else
      render :edit
    end
  end

end

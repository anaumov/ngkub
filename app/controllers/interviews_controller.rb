class InterviewsController < ApplicationController

def create
    @interview = Interview.new(params[:interview])

    if @interview.save
      redirect_to interviews_path
    else
      render :new
    end  
  end

  def new
    @interview = Interview.new
  end
  

  def show
    @interview = Interview.where(:id => params[:id]).first
    @parent = @interview
   unless @interview  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

  def index
    @interviews = Interview.all
    
    unless @interviews
      flash[:notice] = "No interviews found"
    end 
  end

  def delete
    begin  
      interview = Interview.where(:id => params[:id]).first
    rescue  
      flash[:notice] = "we haven't Interview with id=" + params[:id]
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end 
    
    unless interview
      flash[:notice] = "Interview " + interview.title + " deleted"
      cat.destroy
      render :index  
    end  
  end

  def edit
    begin  
      @interview = Interview.find(params[:id])
    rescue  
      render :file => "#{Rails.root}/public/404.html", :layout => true, :status => 404
    end
  end

  def update
    @interview = Interview.find(params[:id])
    
    if @interview.update_attributes(params[:interview] )
      redirect_to @interview
    else
      render :edit
    end
  end

end

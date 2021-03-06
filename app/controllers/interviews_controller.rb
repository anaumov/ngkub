class InterviewsController < ApplicationController
  before_filter :check_user, :only => [:new, :create, :edit, :update]
  cache_sweeper :interview_sweeper

  def create
    expire_action :controller => :pages, :action => :indexpage
    @interview = Interview.create(params[:interview])

    if @interview.errors.empty?
      redirect_to interviews_path
    else
      render :new
    end  
  end

  def new
    @interview = Interview.new
  end
  

  def show
    @interview = Interview.find_by_slug(params[:id])
    check_publish(@interview)
    @comment  = Comment.new
    @answer   = Answer.new
    @question = Question.new
    unless @interview  
      render :file => "#{Rails.root}/public/404.html", :status => 404
      return    
    end 
  end

  def index
    @interviews = Interview.paginate(:page => params[:page], :order => "created_at DESC")
    
    unless @interviews
      flash[:notice] = "No interviews found"
    end 
  end

  def destroy
    expire_action :controller => :pages, :action => :indexpage
    interview = Interview.find_by_slug(params[:id])

    if interview
      flash[:notice] = "Interview " + interview.title + " deleted"
      interview.destroy
      redirect_to interviews_path 
    else
      render_404
    end 
    
  end

  def edit
    begin  
      @interview = Interview.find_by_slug(params[:id])
    rescue  
      render_404
    end
  end

  def update
    expire_action :controller => :pages, :action => :indexpage
    @interview = Interview.find_by_slug(params[:id])
    
    if @interview.update_attributes(params[:interview] )
      redirect_to @interview
    else
      render :edit
    end
  end

end

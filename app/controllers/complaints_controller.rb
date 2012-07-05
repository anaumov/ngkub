class ComplaintsController < ApplicationController
 #before_filter :check_user, :only => [:new, :create, :edit, :update]
  
  def create
    @complaint = Complaint.create(params[:complaint])

    if @complaint.errors.empty?
      redirect_to complaints_path
    else
      render :new
    end  
  end

  def new
    @complaint = Complaint.new
  end
  
  def show
    @complaint = Complaint.find(params[:id])
    
    @comment  = Comment.new
    unless @complaint  
      render :file => "#{Rails.root}/public/404.html", :status => 404
      return    
    end 
  end

  def index
#    @complaints = Complaint.paginate(:page => params[:page], :order => "created_at DESC")
    @complaints = Complaint.find(:all)

    unless @complaints
      flash[:notice] = "No complaints found"
    end 
  end

  def destroy
    complaint = Complaint.find(params[:id])

    if complaint
      flash[:notice] = "Complaint " + complaint.title + " deleted"
      complaint.destroy
      redirect_to complaints_path 
    else
      render_404
    end 
    
  end

  def edit
    begin  
      @complaint = Complaint.find(params[:id])
    rescue  
      render_404
    end
  end

  def update
    @complaint = Complaint.find(params[:id])
    
    if @complaint.update_attributes(params[:complaint] )
      redirect_to @complaint
    else
      render :edit
    end
  end
end

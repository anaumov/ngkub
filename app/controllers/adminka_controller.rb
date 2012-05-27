class AdminkaController < ApplicationController
before_filter :check_user
  def index
    @comments  = Comment.find(:all,  :order => "created_at", :limit => 5)
    @questions = Question.all
    @users     = User.all
  end
  
  def comments
    @comments  = Comment.paginate(:page => params[:page], :order => "created_at")
  end
end

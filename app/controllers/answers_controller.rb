class AnswersController < ApplicationController

  def create
    
    @answer = Answer.create(params[:answer])
    if @answer.errors.empty?
      flash[:notice] = "answered!"
    end
    redirect_to @answer.question.interview
  end
  
  def show
    @answer = Answer.where(:id => params[:id]).first
    unless @publication  
       render :file => "#{Rails.root}/public/404.html", :status => 404
       return    
    end 
  end

end

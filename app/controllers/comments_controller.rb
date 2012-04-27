class CommentsController < ApplicationController

  def create
    @comment = Comment.create(params[:comment])
    if @comment.errors.empty?
      flash[:notice] = "Successfully created comment."
    else
      flash[:warning] = "Smth went wrong"
    end
    redirect_to @comment.commentable
  end

  def delete
    comment = Comment.where(:id => params[:id]).first
    unless comment
      flash[:notice] = "Comment " + comment.body + " deleted"
      comment.destroy
      render "adminka#index"  
    end  
  end


end

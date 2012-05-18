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

  def destroy
    comment = Comment.find(params[:id])
    if comment
      flash[:notice] = "Comment " + comment.body + " deleted"
      comment.destroy
      redirect_to "/adminka"  
    end  
  end


end

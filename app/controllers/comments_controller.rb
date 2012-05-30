class CommentsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers
  def create
    if simple_captcha_valid?
      @comment = Comment.create(params[:comment])
      if @comment.errors.empty?
        flash[:notice] = t(:comment_created)
      else
        flash[:notice] = "Smth went wrong"
      end
      redirect_to @comment.commentable
    else
      model = params[:comment][:commentable_type]
      object = model.constantize.find(params[:comment][:commentable_id])
      flash[:alert] = t(:capcha_denied)
      redirect_to object     
    end

  end

  def destroy
    comment = Comment.find(params[:id])
    if comment
      flash[:notice] = "Comment deleted"
      comment.destroy
      redirect_to "/adminka"  
    end  
  end


end

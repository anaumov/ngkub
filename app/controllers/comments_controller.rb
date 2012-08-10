class CommentsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers
  cache_sweeper :comment_sweeper 

  def create
    if simple_captcha_valid?
      @comment = Comment.create(params[:comment])
      if @comment.errors.empty?
        @message = t(:comment_created)
      else
        @message = "Smth went wrong"
      end
   else
      model = params[:comment][:commentable_type]
      object = model.constantize.find(params[:comment][:commentable_id])
      @message = t(:capcha_denied)
    end

    respond_to do |format|
      format.js 
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

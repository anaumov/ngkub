class CommentsController < ApplicationController
  #def create
   # @imageable ||= parent_class.find(params["#{parent}_id"])
   # @comment = @imageable.comments.create(params[:comment])
   # redirect_to @imageable
  #end


  def create
    @parent = find_parent
    @comment = @parent.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @parent
    else
      render @parent
    end
  end

private

  def find_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end

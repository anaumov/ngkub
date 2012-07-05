class PostsController < ApplicationController

  def create
    @post = Post.create(params[:post])

    if @post.errors.empty?
      redirect_to posts_path
    else
      render :new
    end  
  end

  def new
    @post = Post.new
  end  
  
  def show
    @post  = Post.find(params[:id])

    unless @post  
       render_404
       return    
    end 
    
    unless @comment
      @comment      = Comment.new
    end

    unless @post  
       render_404
       return    
    end 
  end

  def index
    @posts = Post.paginate(:page => params[:page], :order => "created_at DESC")

    unless @posts
      flash[:notice] = "No posts found"
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post 
      flash[:notice] = "Post " + @post.title + " deleted"
      @post.destroy
      redirect_to posts_path  
    else
      flash[:notice] = "we haven't Post with id=" + params[:id]
      render_404
    end  
  end

  def edit
     unless @post = Post.find(params[:id])
        render_404
     end
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render :edit
    end
  end

  def rss
    @post = Post.find(:all, :order => "id DESC", :limit => 20)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
end

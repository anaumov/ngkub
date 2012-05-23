class PublicationsController < ApplicationController

  before_filter :check_user, :only => [:new, :create, :edit, :update]
  require 'csv'

  def create
    @publication = Publication.create(params[:publication])

    if @publication.errors.empty?
      redirect_to publications_path
    else
      render :new
    end  
  end

  def new
    @publication = Publication.new
    @categories  = Category.all
  end

  def import
    if params[:file]
      csv_text = params[:file].read
      csv = CSV.parse(csv_text, :col_sep => "----", :quote_char => "'")
            
      csv.each do |row|
        @row = row
        if false
        title = row[3].force_encoding('utf-8')
        intro = row[4].force_encoding('utf-8')
        body  = row[5].force_encoding('utf-8')
        date  = row[7]
        slug  = "old_news_" + row[0]
        Publication.create(
          title: title,
          slug: slug,
          intro: intro,
          body: body,
          created_at: date
          )
        end
      end
    end
  end
  
  def show
    @publication  = Publication.find_by_slug(params[:id])
    #[ "category_id = ?", @publication.category.id]
    if @publication.category
      @related_pubs = Publication.find(:all, :conditions => [ "category_id = ? AND id != ?", @publication.category.id, @publication.id.to_i ],:limit => 5)    
    end
    @comment      = Comment.new
    
    unless @publication  
       render_404
       return    
    end 
  end

  def index
    @publications = Publication.paginate(:page => params[:page])

    unless @publications
      flash[:notice] = "No publications found"
    end
  end

  def destroy
    @publication = Publication.find_by_slug(params[:id])

    if @publication 
      flash[:notice] = "Publication " + @publication.title + " deleted"
      @publication.destroy
      redirect_to publications_path  
    else
      flash[:notice] = "we haven't Publication with id=" + params[:id]
      render_404
    end  
  end

  def edit
     @categories = Category.all
     unless @publication = Publication.find_by_slug(params[:id])
        render_404
     end
  end

  def update
    @publication = Publication.find_by_slug(params[:id])
    
    if @publication.update_attributes(params[:publication])
      redirect_to @publication
    else
      render :edit
    end
  end

  def rss
    @publication = Publication.find(:all, :order => "id DESC", :limit => 20)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

end

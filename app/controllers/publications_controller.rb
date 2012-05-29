class PublicationsController < ApplicationController

  before_filter :check_user, :only => [:new, :create, :edit, :update, :import]
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
#for pubs
              if true
                  old_id = row[0]
                  issue  = row[1]
                  title  = row[3].force_encoding('utf-8')
                  if row[4]
                   intro  = row[4].force_encoding('utf-8')
                  else
                   intro  = row[3].force_encoding('utf-8')
                  end

                  if row[5]
                   body  = row[5].force_encoding('utf-8')
                  else
                   body  = row[4].force_encoding('utf-8')
                  end
                                            
                  date   = row[7]
                  slug   = "old_" + row[0]
                  
                  
                  case row[2].to_i
                    when 23,24,27
                      category_id = 1          
                    when 1,4,5,10
                      category_id = 2
                    when 6,7
                      category_id = 3
                    when 14
                      category_id = 4
                    when 28,8
                      category_id = 6
                    when 13
                      category_id = 7
                    when 11
                      category_id = 8
                    else
                      category_id = 5
                  end
                
                 @row = row
                  Publication.create(
                    title: title,
                    slug: slug,
                    intro: intro,
                    body: body,
                    category_id: category_id,
                    created_at: date,
                    old_id: old_id,
                    issue: issue    
                    )
                end
#for_comments
             if false
                unless row[1].to_i == 0 
                  pub = Publication.where("old_id = ?", row[1].to_i).first
                  if pub
                    commentable_id = pub.id
                  end                  
                  if row[2]
                    autor = row[2].force_encoding('utf-8')
                  else
                    autor = "Anonumous"
                  end 
                  if row[3]
                    body = row[3].force_encoding('utf-8')
                  else
                    body = "none"
                  end 
                  date  = row[4]
                  
                   
              
                  Comment.create(
                    autor: autor,
                    body: body,
                    commentable_id: commentable_id,
                    commentable_type: "Publication",
                    created_at: date
                    )
                end
                end





      end
    end
  end
  
  def show
    @publication  = Publication.find_by_slug(params[:id])
    unless @publication  
       render_404
       return    
    end 
    check_publish(@publication)
    if @publication
      #@related_pubs = Publication.find(:all, :conditions => [ "category_id = ? AND id != ?",    @publication.category.id, @publication.id.to_i ],:limit => 5)
      @related_pubs = Publication.find(:all, :conditions => ['publish = ? AND id != ?', true, @publication.id], :order => "created_at DESC", :limit => 5) 
    end
    unless @comment
      @comment      = Comment.new
    end

    unless @publication  
       render_404
       return    
    end 
  end

  def index
    @publications = Publication.paginate(:page => params[:page], :order => "created_at DESC")

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

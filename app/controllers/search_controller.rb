class SearchController < ApplicationController

  def index
    @query = params[:query]
    @results = Publication.search params[:query], :page => params[:page], :per_page => 20
  
  end

end

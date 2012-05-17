class SearchController < ApplicationController

  def index
    @results = Publication.search params[:query]
  end

end

class AdminkaController < ApplicationController

  def index
    @comments  = Comment.all
    @questions = Question.all
  end

end

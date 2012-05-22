class AdminkaController < ApplicationController
before_filter :check_user
  def index
    @comments  = Comment.all
    @questions = Question.all
    @users     = User.all
  end

end

class AdminkaController < ApplicationController
  before_filter :authenticate_user!

  def index
    unless current_user.admin?
      redirect_to root_path
    end
    @comments  = Comment.all
    @questions = Question.all
    @users     = User.all
  end

end

class QuestionsController < ApplicationController

  def create
    
    @interview = Interview.find(params[:interview_id])
    @question  = @interview.question.build(params[:question])
    
   if @question.save
      flash[:notice] = "Successfully created question"
      redirect_to @interview
    else
      render @interview
    end
  end

end

class QuestionsController < ApplicationController

  def create
    #@interview = Interview.find(params[:interview_id])
    #@question  = @interview.question.build(params[:question])
    @question = Question.create(params[:question])
    
   if @question
      flash[:notice] = "Successfully created question"
      redirect_to @question.interview
    else
      render @question.interview
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question
      flash[:notice] = "Question " + question.body + " deleted"
      question.destroy
      redirect_to "/adminka" 
    end  
  end

end

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

  def delete
    question = Question.where(:id => params[:id]).first
    unless question
      flash[:notice] = "Question " + question.body + " deleted"
      question.destroy
      render "adminka#index"  
    end  
  end

end

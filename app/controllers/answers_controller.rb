class AnswersController < ApplicationController
  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    redirect_to @question unless authorized?(@answer)
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    @answer.save
    redirect_to @question
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if authorized?(@answer)
      if @answer.update(answer_params)
        redirect_to @question
      else
        render 'edit'
      end
    else
      redirect_to @question
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if authorized?(@answer)
      @answer.destroy
    end
    redirect_to question_path(@question)
  end


  private
    def answer_params
      params.require(:answer).permit(:text)
    end
end

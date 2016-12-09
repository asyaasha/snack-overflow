class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
    redirect_to @question unless authorized?(@question)
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user if current_user
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    if authorized?(@question)
      if @question.update(question_params)
        redirect_to @question
      else
        render 'edit'
      end
    else
      redirect_to @question
    end
  end

  def destroy
    if authorized?(@question)
      @question.destroy
      redirect_to questions_path
    else
      redirect_to @question
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :text)
    end

    def find_question
      @question =Question.find(params[:id])
    end

end

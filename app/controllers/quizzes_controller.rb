class QuizzesController < ApplicationController
  def  index
    @quizzes = Quiz.all
  end
  def  new
    @quiz = Quiz.new
  end
  def create
    @quiz = Quiz.new(quiz_params)
    begin 
      @quiz.save!
      redirect_to root_path
    rescue => e
      p e
      session[:error] = @quiz.errors.full_messages
      redirect_to new_quiz_path
    end
  end



  def show
    @quiz = Quiz.find(params[:id])
    gon.modelAnswer = @quiz
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :question, :answer)
  end
end

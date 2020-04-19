class QuizzesController < ApplicationController
  def  index
    @quizzes = Quiz.all
  end
  def  new
    @quiz = Quiz.new
    @languages = Language.find(1)
  end

  def lang
    return nil if params[:keyword] == ""
    @languages = Language.where(["language LIKE ?", "%#{params[:keyword]}%"]).limit(10)
    
    # respond_to do |format|
    #   format.html #htmlを読み込んであげないとエラーが出るのでしっかりと記述
    #   format.json 
    # end
    render json: @languages
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

  def destroy
    quiz = Quiz.find(params[:id])
    quiz.destroy
    redirect_to :root
  end
  private

  def quiz_params
    params.require(:quiz).permit(:title, :question, :answer,:language_id)
  end
end

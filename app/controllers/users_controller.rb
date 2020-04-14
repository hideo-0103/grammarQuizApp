class UsersController < ApplicationController

  def index
    
  end

  def challenge
    gon.quizzes = Quiz.all
    @quizzes = Quiz.all
  end
end

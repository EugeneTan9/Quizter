class HomeController < ApplicationController
  def index
    @quizzes = Quiz.all
  end
end

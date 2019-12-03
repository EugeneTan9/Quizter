class HomeController < ApplicationController
  def index
    @allQuizzes = Quiz.all
    @results = Result.all
    @badges = Badge.all

  @quizzes = Quiz.left_outer_joins(:results).group(:id).order('COUNT(results.id) DESC')

  @quizzesCount = Result.group(:quiz_id).count

  @users = User.left_outer_joins(:results).group(:id).order('COUNT(results.id) DESC')

  @badgesCount = Result.group(:user_id).count



  end
end

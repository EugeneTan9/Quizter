class HomeController < ApplicationController
  def index
    # @quizzes = Quiz.all
    @results = Result.all


  @quizzes = Quiz.left_outer_joins(:results).group(:id).order('COUNT(results.id) DESC')


  @quizzesCount = Result.group(:quiz_id).count

  @badges = Quiz.left_outer_joins(:results).group(:id).order('COUNT(results.id) DESC')

  @badgesCount = Result.group(:user_id).count
  end
end

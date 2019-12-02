class HomeController < ApplicationController
  def index
    @quizzes = Quiz.all
    @results = Result.all

    @quizzes.each do |quiz|
      @results.each do |result|
        if quiz.id == result.quiz_id 
        #  quiz.newNumber = quiz.newNumber +1 

        end
      end  
    end


  end
end

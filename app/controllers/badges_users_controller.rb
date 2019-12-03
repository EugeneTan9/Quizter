class BadgesUsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    p "eeeeeeeeeeeeeeeeeee"
    p params
    p "eeeeeeeeeeeeeeeeeee"
    p current_user.id
    p "eeeeeeeeeeeeeeeeeee"

    @badgesUser = BadgesUser.new(badgesUser_params)
    # @badgesUser[:badge_id] = params[:badge_id]
    @badgesUser[:user_id] = current_user.id
    p "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
    p @badgesUsers
    p "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
    @badgesUser.save
  end

  def badgesUser_params
    params.require(:badgesUser).
      permit(:badge_id, :user)
  end

end
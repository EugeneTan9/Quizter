class BadgesUsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    p "IN BADGES USERSSS"
    p "///////////////"
    p params
    p "///////////////"
    p current_user.id
    p "///////////////"
    p request.raw_post

    @badgesUser = BadgesUser.new()
    @badgesUsers[:badge_id] = params[:badge_id]
    @badgesUser.user = current_user
    p "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
    p @badgesUsers
    p "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
    @badgesUser.save
  end



end
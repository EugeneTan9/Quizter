class BadgesUsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @badgesUser = BadgesUser.new()
    @badge = Badge.find(params[:badge_id])
    @badgesUser.badge = @badge
    @badgesUser.user = current_user
    @badgesUser.save
  end



end
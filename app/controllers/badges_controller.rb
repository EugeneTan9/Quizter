class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  # GET /badges
  # GET /badges.json
  def index

    @badges = Badge.all

    # @users = User.left_outer_joins(:results).group(:id).order('COUNT(results.id) DESC')

  end

  def created
    # @badges = Badge.where(user_id: current_user)
    # need endpoint that gives user_id for the badge
    # @user = current_user
    # @created = []
    # @user.quizzes.each do |quiz|
    #   @created.push(quiz.badges)
    # end
  end


  # GET /badges/1
  # GET /badges/1.json
  def show
    @badge = url_for(Badge.find(params[:id]))
  end

  # GET /badges/new
  def new
    @quiz_id = params[:quiz_id]
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit
    @quiz_id = Badge.find(params[:id]).quiz.id
  end

  # POST /badges
  # POST /badges.json
  def create
    @badge = Badge.new(badge_params)
    @quiz = @badge.quiz
    respond_to do |format|
      if @badge.save
        format.html { redirect_to edit_quiz_path(@quiz) }
        format.json { render :show, status: :created, location: @badge }
      else
        format.html { render :new }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to @badge, notice: 'Badge was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge }
      else
        format.html { render :edit }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    @badge.destroy
    respond_to do |format|
      format.html { redirect_to badges_url, notice: 'Badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
      params.require(:badge).permit(:quiz_id, :title, :criteria, :img_url, :user_id)
    end
end
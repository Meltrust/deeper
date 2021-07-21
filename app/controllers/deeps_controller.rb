class DeepsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deep, only: %i[show edit update destroy]

  # GET /deeps or /deeps.json
  def index
    # @deeps = Deep.all
    @deep = Deep.new
    @user = User.find_by(params[:id])
    @users = User.all
    timeline_deeps
    followsection_users
    followedbysection_users
    liked?
  end

  # GET /deeps/1 or /deeps/1.json
  def show; end

  # GET /deeps/new
  def new
    @deep = Deep.new
  end

  # GET /deeps/1/edit
  def edit; end

  # POST /deeps or /deeps.json
  def create
    @deep = current_user.deeps.new(deep_params)

    if @deep.save
      redirect_to root_path, notice: 'Deep was posted.'
    else
      redirect_to root_path, alert: 'Deep was not created'
    end
  end

  # PATCH/PUT /deeps/1 or /deeps/1.json
  def update
    if @deep.update(deep_params)
      redirect_to @deep, notice: 'Deep was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /deeps/1 or /deeps/1.json
  def destroy
    @deep.destroy
    respond_to do |format|
      format.html { redirect_to deeps_url, notice: 'Deep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.followeds << @user
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followed_id: @user.id).destroy
    redirect_back(fallback_location: root_path)
  end

  def liked?
    @pre_like = @deep.likes.find { |like| like.user_id == current_user.id }
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def timeline_deeps
    user_and_following_deeps = [current_user.id] + current_user.followeds.map(&:id)
    @timeline_deeps ||= Deep.where(user_id: user_and_following_deeps).ordered_by_most_recent.includes(:user)
  end

  def followsection_users
    not_followed_users = current_user.followeds.map(&:id)
    @followsection_users ||= User.where.not(id: not_followed_users).where.not(id: current_user.id)
  end

  def followedbysection_users
    followed_users = @user.followers.map(&:id)
    @followedbysection_users ||= User.where(id: followed_users)
  end

  # User.where("id NOT IN ?", ids)
  def set_deep
    @deep = Deep.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deep_params
    params.require(:deep).permit(:text)
  end
end

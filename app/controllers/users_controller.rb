class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @users = User.all
    @user = User.find_by_id(params[:id])
    @deeps = @user.deeps.ordered_by_most_recent
    @deep = Deep.new

    timeline_deeps
  end

  # PATCH/PUT /deeps/1 or /deeps/1.json
  def update
    @user = User.find_by_id(params[:id])
    @users = User.all
    if current_user.update(user_params)
      redirect_to current_user
    else
      redirect_to current_user, notice: 'Photo was not chosen.'
    end
  end

  def timeline_deeps
    user_and_following_deeps = current_user.id
    # + current_user.friends.map(&:id)
    @timeline_deeps ||= Deep.where(user_id: user_and_following_deeps).ordered_by_most_recent.includes(:user)
  end

  def user_params
    params.require(:user).permit(:photo, :cover_image)
  end
end

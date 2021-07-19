class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @users = User.all
    @user = User.find_by_id(params[:id])
    @deeps = @user.deeps.ordered_by_most_recent
    @deep = Deep.new

    followsection_users
    timeline_deeps
    followedbysection_users
  end

  def follow
    @user = User.find(params[:id])
    current_user.followeds << @user
  end

  def unfollow
    @user = User.find_by_id(params[:id])
    current_user.followed_users.find_by(followed_id: @user.id).destroy
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

  def followsection_users
    not_followed_users = current_user.followers.map(&:id)
    @followsection_users ||= User.where(user_id: not_followed_users)
  end

  def followedbysection_users
    followed_users = current_user.followers.map(&:id)
    @followedbysection_users = User.where(user_id: followed_users)
  end

  def user_params
    params.require(:user).permit(:photo, :cover_image)
  end
end

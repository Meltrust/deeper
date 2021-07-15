class UsersController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @users = User.all
  #   @user = User.find_by(params[:id])
  # end

  def show
    @users = User.all
    @user = User.find_by_id(params[:id])
    @deeps = @user.deeps.ordered_by_most_recent
    @deep = Deep.new

    timeline_deeps
  end

  def timeline_deeps
    user_and_following_deeps = current_user.id
    # + current_user.friends.map(&:id)
    @timeline_deeps ||= Deep.where(user_id: user_and_following_deeps).ordered_by_most_recent.includes(:user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :avatar)
  end
end

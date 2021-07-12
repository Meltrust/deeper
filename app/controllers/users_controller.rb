class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = User.find_by(params[:id])
  end

  def show
    @user = User.find_by_id(params[:id])
    @deeps = @user.deeps.ordered_by_most_recent
  end
end

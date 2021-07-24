class DeepsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deep, only: %i[show edit update destroy]

  # GET /deeps or /deeps.json
  def index
    @deep = Deep.new
    @user = User.find_by(params[:id])
    @users = User.all
    @user_agent = request.user_agent
    @client = DeviceDetector.new(@user_agent)
    timeline_deeps
    followsection_users
    followedbysection_users
    liked?
    set_meta_tags title: 'Deeper',
                  site: 'Deeper',
                  description: 'Share your daily wisdom',

                  og: {
                    title: 'Deeper',
                    description: 'Share your daily wisdom',
                    type: 'website',
                    url: request.original_url,
                    image: 'https://res.cloudinary.com/dvxcld/image/asset/v1627105360/meta-img-e0def810f2ec93ba67f683f3e22ec741.png',
                    width: '1200', height: '630'
                  }
  end

  # GET /deeps/new
  def new
    @deep = Deep.new
  end

  # POST /deeps or /deeps.json
  def create
    @deep = current_user.deeps.new(deep_params)

    if @deep.save
      redirect_to root_path, notice: 'Deep was posted.'
    else
      redirect_to root_path, alert: 'Deep was not created'
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

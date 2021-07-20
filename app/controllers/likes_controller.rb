class LikesController < ApplicationController
  before_action :find_deep
  before_action :find_like, only: [:destroy]

  def create
    @deep.likes.create(user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like.destroy if already_liked?
    redirect_back(fallback_location: root_path)
  end

  def find_deep
    @deep = Deep.find(params[:deep_id])
  end

  def find_like
    @like = @deep.likes.find(params[:id])
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, deep_id:
    params[:deep_id]).exists?
  end
end

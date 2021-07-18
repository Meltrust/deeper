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

  private

  # Use callbacks to share common setup or constraints between actions.

  def timeline_deeps
    user_and_following_deeps = current_user.id
    # + current_user.friends.map(&:id)
    @timeline_deeps ||= Deep.where(user_id: user_and_following_deeps).ordered_by_most_recent.includes(:user)
  end

  def set_deep
    @deep = Deep.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deep_params
    params.require(:deep).permit(:text)
  end
end

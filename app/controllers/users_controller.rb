class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.where(destinator_id: @user)
    authorize @user
  end
end

class UsersController < ApplicationController
  def show
    @user = current_user
    @review = Review.find(@user.id)
  end
end

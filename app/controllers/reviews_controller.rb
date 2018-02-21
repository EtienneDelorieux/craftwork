class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @project = Project.find(params[:project_id])
    # @application = Application.where(project_id: params[:project_id]).where(selected: true)
    @review.creator = @project.user
    # @review.destinator = @application.user
    # raise
  end

  def create
    @review = Review.new(review_params)
    @review.creator = current_user


    if @review.save
      redirect_to project_path(@user)
    else
      render :new
      console.log(@review.errors)
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating, :creator_id, :destinator_id, :creator_id)
  end

end

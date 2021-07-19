class Api::V1::ReviewsController < Api::V1::BaseController
  before_action :find_review, only: [:destroy]

  def create
    @review = Review.new(review_params)
    # @review.save
    if @review.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @review.destroy
  end

  def show_space_reviews
    @reviews = Review.where("space_id = #{params[:space_id]}")
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :space_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end

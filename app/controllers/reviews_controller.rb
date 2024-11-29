class ReviewsController < ApplicationController
  def create
    @toilet = Toilet.find(params[:toilet_id])
    @review = @toilet.reviews.new(review_params)
    @review.user = current_user  # Assuming you're using Devise or similar

    if @review.save
      redirect_to toilet_path(@toilet), notice: 'Review was successfully created.'
    else
      redirect_to toilet_path(@toilet), alert: 'Error creating review.'
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :content, :clean, :dirty, :accessible,
      :paid_entry, :female_friendly, :well_located) # add other permitted attributes
  end
end

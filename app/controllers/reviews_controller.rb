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

  def destroy
    @toilet = Toilet.find(params[:toilet_id])
    @review = Review.find(params[:id])

    if @review.user == current_user
      if @review.destroy
        flash[:notice] = 'Review was successfully deleted.'
      else
        flash[:alert] = 'Error deleting review.'
      end
    else
      flash[:alert] = 'You can only delete your own reviews.'
    end

    redirect_to toilet_path(@toilet), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :clean, :dirty, :accessible,
      :paid_entry, :female_friendly, :well_located) # add other permitted attributes
  end
end

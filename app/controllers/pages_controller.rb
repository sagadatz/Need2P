class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @reviewed_toilets = Toilet.joins(:reviews).where(user: current_user)
    @last_visited_toilets = current_user.reviews.includes(:toilet).order(created_at: :desc).map(&:toilet).uniq.first(6)
  end
end

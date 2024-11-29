class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @reviewed_toilets = Toilet.joins(:reviews).where(user: current_user)
  end
end

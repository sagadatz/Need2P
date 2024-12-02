class ToiletsController < ApplicationController
  def new
    @toilet = Toilet.new
  end

  def create
    @toilet = Toilet.new(toilet_params)
    if @toilet.save
      redirect_to toilet_path(@toilet), notice: 'Toilet added successfully.'
    else
      render :new, alert: 'Error adding toilet.'
    end
  end

  def index
    @toilets = Toilet.all

    if params[:query].present?
      @toilets = Toilet.where("name ILIKE ? OR location ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @toilets = Toilet.all
    end

    if params[:filters].present?
      @toilets = @toilets.joins(:reviews)
      @toilets = @toilets.where(reviews: { female_friendly: params[:filters][:female_friendly] == "on" })
      @toilets = @toilets.where(reviews: { handicap_friendly: params[:filters][:handicap_friendly] == "on" })
      @toilets = @toilets.where(paid: true) if params[:filters][:paid]

    #   @toilets = @toilets.handicap_friendly if params[:filters][:handicap_friendly]
    #   @toilets = @toilets.family_friendly if params[:filters][:family_friendly]
    #   @toilets = @toilets.where("rating >= ?", params[:filters][:stars]) if params[:filters][:stars]
    #   @toilets = @toilets.where(paid: true) if params[:filters][:paid]
    #   @toilets = @toilets.where(paid: false) if params[:filters][:free]
    #   @toilets = @toilets.clean if params[:filters][:clean]
    #   @toilets = @toilets.dirty if params[:filters][:dirty]
    #   @toilets = @toilets.accessible if params[:filters][:accessible]
    end

    @markers = @toilets.geocoded.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        #info_window_html: render_to_string(
          #partial: "info_window",
          #locals: { toilet: toilet }
        #),
        #marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @toilet = Toilet.find(params[:id])
    @review = Review.new
    @markers = [{
      lat: @toilet.latitude,
      lng: @toilet.longitude
    }]
  end

  def autocomplete
    query = params[:query]
    toilets = Toilet.where("name ILIKE ? OR location ILIKE ?", "%#{query}%", "%#{query}%").limit(5)
    render json: toilets.pluck(:name, :location).flatten.uniq
  end

  private

  def toilet_params
    params.require(:toilet).permit(
      :name,
      :description,
      :latitude,
      :longitude,
      :image,
      :female_friendly,
      :handicap_friendly,
      :family_friendly,
      :clean,
      :accessible,
      :paid,
      :rating
    )
  end
end

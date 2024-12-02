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
    if params[:query].present?
      @toilets = Toilet.where("name ILIKE ? OR location ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @toilets = Toilet.all
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
    params.require(:toilet).permit(:name, :description, :latitude, :longitude, :image)
  end
end

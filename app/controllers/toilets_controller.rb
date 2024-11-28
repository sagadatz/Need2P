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
    @markers = [{
      lat: @toilet.latitude,
      lng: @toilet.longitude
    }]
  end

  private

  def toilet_params
    params.require(:toilet).permit(:name, :description, :latitude, :longitude, :image)
  end
end

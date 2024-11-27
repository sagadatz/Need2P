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
    @your_models = YourModel.all

    @markers = @your_models.map do |model|
      {
        lat: model.latitude,
        lng: model.longitude,
        info_window: render_to_string(
          partial: "info_window",
          locals: { model: model }
        )
      }
    end
  end

  def show
  end


  private

  def toilet_params
    params.require(:toilet).permit(:name, :description, :latitude, :longitude, :image)
  end
end

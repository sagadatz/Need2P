class ToiletsController < ApplicationController
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
end

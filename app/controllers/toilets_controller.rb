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
  end

  def show
  end


  private

  def toilet_params
    params.require(:toilet).permit(:name, :description, :latitude, :longitude, :image)
  end
end

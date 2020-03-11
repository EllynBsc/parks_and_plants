class PlantsController < ApplicationController
  def new
    # raise
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new
  end

  def create
    @garden = Garden.find(params[:garden_id]) # garden is the garden_id coming from the url with the nested resource
    @plant = Plant.new(plants_strong_params)
    @plant.garden = @garden
    @plant.save!
    # raise
    redirect_to garden_path(@garden)
     # redirect_to garden_path(@plant.garden)
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to garden_path(@plant.garden)
  end

  private

  def plants_strong_params
    params.require(:plant).permit(:name, :price, :image)
  end



end

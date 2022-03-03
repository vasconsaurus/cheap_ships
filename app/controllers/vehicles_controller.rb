class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[edit update show]

  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to @vehicle, notice: 'Vehicle was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'Vehicle was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :category, :price, :description, :kilometer, :year)
  end
end

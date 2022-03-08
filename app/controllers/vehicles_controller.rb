class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @vehicles = policy_scope(Vehicle)
    @order = Order.new

    if params[:query].present?
      @vehicles = Vehicle.global_search(params[:query])
    else
      @vehicles = Vehicle.all
    end
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
    authorize @vehicle
  end

  def create

    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    @vehicle.price = params[:vehicle][:price].delete(".").delete(",").to_i


    authorize @vehicle

    if @vehicle.save
      redirect_to @vehicle, notice: 'Vehicle was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

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

  def my_vehicles
    @vehicles = policy_scope(Vehicle)
    authorize Vehicle
    @vehicles = @vehicles.where(user: current_user)
    @vehicles_ordered = Vehicle.joins(:order).where(order: current_user.orders)
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
    authorize @vehicle
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :category,  :description, :kilometer, :year, photos:[])
  end


end

class OrdersController < ApplicationController
  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @order = Order.new(vehicle: @vehicle, user: current_user)

    authorize @order

    if @order.save
      # @vehicle.update(available: false)
      redirect_to vehicle_order_path(@vehicle.id, @order.id), notice: "Your vehicle has been purchased"
    else
      redirect_to vehicle_path(@vehicle.id), notice: "Failed"
    end
  end

  def show
    @order = Order.find(params[:id])
    @vehicle = Vehicle.find(params[:vehicle_id])

    authorize @order
  end
end

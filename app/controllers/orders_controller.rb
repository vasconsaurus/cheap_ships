class OrdersController < ApplicationController
  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @order = Order.new(vehicle: @vehicle, user: current_user)
    if @order.save
      @vehicle.update(available: false)
      redirect_to vehicles_path, notice: "Your vehicle has been purchased"
    else
      redirect_to @vehicle, notice: "Failed"
    end
  end
end

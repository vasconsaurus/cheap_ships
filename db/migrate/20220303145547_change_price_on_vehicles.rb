class ChangePriceOnVehicles < ActiveRecord::Migration[6.1]

  def change
    change_column :vehicles, :price, :decimal
  end
end

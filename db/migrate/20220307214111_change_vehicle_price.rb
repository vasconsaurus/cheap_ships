class ChangeVehiclePrice < ActiveRecord::Migration[6.1]
  def up
    change_column :vehicles, :price, :integer
  end

  def down
    change_column :vehicles, :price, :decimal
  end
end

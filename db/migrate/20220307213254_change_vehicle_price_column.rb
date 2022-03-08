class ChangeVehiclePriceColumn < ActiveRecord::Migration[6.1]
  def change
    def up
      add_column :vehicles, :price, :integer
    end

    def down
      remove_column :vehicles, :price, :decimal
    end
  end
end

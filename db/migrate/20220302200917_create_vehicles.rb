class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string   :name,           null: false, default: ""
      t.string   :category,       null: false, default: ""
      t.float    :price,          precision: 2, null: false, default: ""
      t.text     :description,    null: false, default: ""
      t.integer  :kilometer,      null: false, default: ""
      t.integer  :year,           null: false, default: ""
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end

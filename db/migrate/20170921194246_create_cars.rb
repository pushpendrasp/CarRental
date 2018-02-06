class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :licenseplate
      t.string :manufacturer
      t.string :model
      t.string :hour_rental
      t.string :style
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end

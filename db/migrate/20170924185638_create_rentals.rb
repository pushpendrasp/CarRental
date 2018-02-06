class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.string :car_id
      t.string :customer_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.string :rental_charge

      t.timestamps
    end
  end
end

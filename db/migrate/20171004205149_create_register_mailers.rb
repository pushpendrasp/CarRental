class CreateRegisterMailers < ActiveRecord::Migration[5.1]
  def change
    create_table :register_mailers do |t|
      t.string :car_id
      t.string :customer_id

      t.timestamps
    end
  end
end

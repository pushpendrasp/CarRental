class CreateCarSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :car_suggestions do |t|
      t.string :model
      t.string :manufacturer
      t.string :style

      t.timestamps
    end
  end
end

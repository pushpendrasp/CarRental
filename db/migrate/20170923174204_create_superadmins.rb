class CreateSuperadmins < ActiveRecord::Migration[5.1]
  def change
    create_table :superadmins do |t|
      t.string :name
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end

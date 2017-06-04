class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :role, unique: true, null: false
      t.text :descr

      t.timestamps
    end
  end
end

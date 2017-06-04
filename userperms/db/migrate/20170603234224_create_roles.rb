class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :role, null: false
      t.text :descr

      t.timestamps
    end
    add_index :roles, :role, unique: true
  end
end

class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :permission, null: false
      t.text :descr

      t.timestamps
    end
    add_index :permissions, :permission, unique: true
  end
end

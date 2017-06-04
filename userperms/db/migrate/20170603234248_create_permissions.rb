class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :permission, unique: true, null: false
      t.text :descr

      t.timestamps
    end
  end
end

class CreateAuthenticationMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :authentication_methods do |t|
      t.string :method, null: false
      t.text :descr

      t.timestamps
    end
    add_index :authentication_methods, :method, unique: true
  end
end

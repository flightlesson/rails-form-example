class CreateAuthenticationMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :authentication_methods do |t|
      t.string :methodname, unique: true, null: false
      t.text :descr

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.string :realname
      t.belongs_to :authentication_methods

      t.timestamps
    end
  end
end

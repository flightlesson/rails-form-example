class RolesUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :roles
    add_index :roles_users, [:role_id, :user_id], unique: true
  end
end

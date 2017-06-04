class PermissionsRoles < ActiveRecord::Migration[5.1]
  def change
    create_join_table :roles, :permissions
    add_index :permissions_roles, [:permission_id, :role_id], unique: true
  end
end

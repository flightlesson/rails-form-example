class RolesPermissions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :roles, :permissions
  end
end

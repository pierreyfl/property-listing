class RevertRolifyCreateRoles < ActiveRecord::Migration[5.2]
  require_relative '20180415065957_rolify_create_roles'

  def change
    revert RolifyCreateRoles
  end
end

class AddAgentIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agent_id, :integer
    add_index :users, :agent_id
  end
end

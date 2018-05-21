class AddSearchVsibilityToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :search_visibility, :integer, default: 0, null: false
  end
end

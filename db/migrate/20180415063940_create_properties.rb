class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :agent_id
      t.timestamps
    end
  end
end

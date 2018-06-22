class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.belongs_to :classified_listing, index: true

      t.timestamps
    end
  end
end

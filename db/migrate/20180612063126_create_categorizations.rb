class CreateCategorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :categorizations, {id: false} do |t|
      t.belongs_to :category, index: true
      t.belongs_to :classified_listing, index: true

      t.timestamps
    end
  end
end

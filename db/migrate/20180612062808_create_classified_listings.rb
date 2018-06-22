class CreateClassifiedListings < ActiveRecord::Migration[5.1]
  def change
    create_table :classified_listings do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

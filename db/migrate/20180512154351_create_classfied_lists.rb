class CreateClassfiedLists < ActiveRecord::Migration[5.1]
  def change
    create_table :classfied_lists do |t|
      t.string :title
      t.decimal :price
      t.integer :time_length

      t.timestamps
    end
  end
end

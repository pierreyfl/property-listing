class CreatePageViews < ActiveRecord::Migration[5.1]
  def change
    create_table :page_views do |t|
      t.string :domain, index: true
      t.integer :count, default: 0
      t.integer :trackable_id
      t.string :trackable_type
      t.timestamps
    end
  end
end

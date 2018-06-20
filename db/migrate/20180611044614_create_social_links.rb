class CreateSocialLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :social_links do |t|
      t.integer :site
      t.string :url
      t.references :linkable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

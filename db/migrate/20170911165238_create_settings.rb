class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.boolean :enable_sms, default: true
      t.boolean :enable_email, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

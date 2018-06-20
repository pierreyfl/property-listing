class RevertCreateSettings < ActiveRecord::Migration[5.1]
  require_relative '20170911165238_create_settings'

  def change
    reversible do |dir|
      dir.down do
        User.find_each do |user|
          Setting.create(user: user, enable_email: true, enable_sms: true)
        end
      end
    end
    revert CreateSettings
  end
end

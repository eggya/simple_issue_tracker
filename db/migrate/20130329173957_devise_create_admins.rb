class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Token authenticatable
      t.string :authentication_token

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Additional
      t.string  :name,               :null => false, :default => ""


      t.timestamps
    end

    add_index :admins, :email,                :unique => true
    add_index :admins, :reset_password_token, :unique => true
    add_index :admins, :authentication_token, :unique => true
  end
end

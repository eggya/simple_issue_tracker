class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text        :body,  :null => false, :default => ''
      t.references  :admin
      t.references  :ticket
      t.timestamps
    end
    add_index :comments, :admin_id
    add_index :comments, :ticket_id
  end
end

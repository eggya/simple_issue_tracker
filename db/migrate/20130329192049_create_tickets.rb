class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string      :name,              :null => false, :default => ''
      t.string      :email,             :null => false, :default => ''
      t.string      :reference_number,  :null => false, :default => ''
      t.text        :subject,           :null => false, :default => ''
      t.string      :token

      t.references  :admin
      t.references  :ticket_status
      t.timestamps
    end
    add_index :tickets, :ticket_status_id
    add_index :tickets, :admin_id
  end
end

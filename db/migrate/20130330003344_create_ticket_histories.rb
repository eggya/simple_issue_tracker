class CreateTicketHistories < ActiveRecord::Migration
  def change
    create_table :ticket_histories do |t|
      t.string     :activity, :null => false, :default => ''
      t.references :ticket
      
      t.timestamps
    end
    add_index :ticket_histories, :ticket_id
  end
end

class Comment < ActiveRecord::Base
  attr_accessible :body, :admin_id, :ticket_id
  validates_presence_of :body, :ticket_id

  belongs_to :ticket
  belongs_to :admin

  after_save :notify_customer

private

  def notify_customer
    SystemMailer.new_message_posted(self.ticket).deliver
  end
end
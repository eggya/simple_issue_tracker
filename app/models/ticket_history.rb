class TicketHistory < ActiveRecord::Base
  attr_accessible :activity
  validates_presence_of :activity

  belongs_to :ticket
end

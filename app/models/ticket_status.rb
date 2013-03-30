class TicketStatus < ActiveRecord::Base
  attr_accessible         :description
  validates_uniqueness_of :description
  validates_presence_of   :description
end

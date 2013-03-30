def seeding_admin
  (1..5).each do |admin|
    Admin.create(
      :name => "admin#{admin}", 
      :email => "admin#{admin}@issuetracker.com", 
      :password => "password", 
      :password_confirmation => "password"
    )
  end
end

def seeding_tickets_status
  statuses = [
    "Waiting for Staff Response", 
    "Waiting for Customer",
    "On Hold", 
    "Cancelled", 
    "Completed"
  ]

  statuses.each do |status|
    TicketStatus.create( :description => status )
  end
end

seeding_admin
seeding_tickets_status
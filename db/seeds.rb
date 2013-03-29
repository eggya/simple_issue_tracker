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

seeding_admin
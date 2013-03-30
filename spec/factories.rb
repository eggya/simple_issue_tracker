Factory.define :admin do |admin|
  admin.sequence(:email) {|n|  "admin#{n}@test.com" }
  admin.name                   "admin"
  admin.password               "password"
  admin.password_confirmation  "password"
end

Factory.define :ticket do |ticket|
  ticket.email                 "customer@test.com"
  ticket.name                  "customer"
end

Factory.define :ticket_status do |ticket|
  ticket.description           "Waiting for Staff Response"
end
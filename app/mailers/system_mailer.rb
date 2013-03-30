class SystemMailer < ActionMailer::Base
  default from: "from@issuetracker.com"

  def new_issue_posted ticket
    @ticket = ticket
    @link = show_my_ticket_url(ticket.token)

    mail(:to => @ticket.email, :subject => I18n.t(".new_issue_posted.subject"))
  end

  def new_updates_posted ticket
    @ticket = ticket
    @link = show_my_ticket_url(ticket.token)
    
    mail(:to => @ticket.email, :subject => I18n.t(".new_updates_posted.subject"))
  end
end

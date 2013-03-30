class TicketsController < ApplicationController
  respond_to :html, :js
  before_filter :filter_homepage

  def new
    @ticket = Ticket.new
    respond_with @ticket
  end

  def create
    return redirect_to root_path if current_admin
    @ticket = Ticket.new(params[:ticket])

    if @ticket.save
      flash.notice = t("tickets.create.information.success")
      redirect_to root_path
    else
      render :new
    end
  end

  def show_my_ticket
    @ticket = Ticket.find_by_token(params[:token])
    @histories = @ticket.ticket_histories

    render "/admin/tickets/show"
  end

private

  def filter_homepage
    redirect_to admin_root_path if current_admin
  end
end

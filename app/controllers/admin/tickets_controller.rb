class Admin::TicketsController < Admin::BaseController  
  before_filter :prepare_ticket, :except => :index
  before_filter :prepare_statuses

  respond_to :html
  
  def index
    @tickets  = Ticket.search(params[:listing_id],params[:keyword])
  end

  def show
    @histories = @ticket.ticket_histories
    respond_with @ticket
  end

  def update_status
    if @ticket.update_attribute(:ticket_status_id,params[:ticket_status_id])
      @ticket.build_update_log current_admin.name,'status'
      return redirect_to admin_ticket_path @ticket 
    end
    
    render :index
  end

  def update_admin
    if @ticket.update_attribute(:admin_id,params[:admin_id])
      @ticket.build_update_log current_admin.name,'admin'
      return redirect_to admin_ticket_path @ticket 
    end
    
    render :index
  end

private

  def prepare_ticket
    @ticket = Ticket.find(params[:id])
  end

  def prepare_statuses
    @statuses = TicketStatus.all
  end

  def write_log
  end
end
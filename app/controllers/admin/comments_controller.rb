class Admin::CommentsController < Admin::BaseController  
  skip_before_filter :authenticate_admin!
  respond_to :html

  def create
    @comment = Comment.new(params[:comment])
    flash.notice = t("comments.create.information.success") if @comment.save

    if signed_in?
      @comment.update_attributes(:admin_id => current_admin.id)
      redirect_to admin_ticket_path(@comment.ticket)
    else
      redirect_to root_path
    end
  end
end
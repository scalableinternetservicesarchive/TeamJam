module ApplicationHelper

   def active_page(active_page)
    @active == active_page ? "active" : ""
  end
def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
end

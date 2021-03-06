class Notifier < ActionMailer::Base
  default from: "info@erfp.ru"

  def comment_updated(comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
         :subject => "[ticketee] #{comment.ticket.project.name} -
         #{comment.ticket.title}")
  end
end

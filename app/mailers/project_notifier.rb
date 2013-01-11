class ProjectNotifier < ActionMailer::Base
  default from: "revdom2@mail.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_notifier.invite.subject
  #
  def invite(employee)
    @greeting = "Hi"

    mail to: ["clearaim@gmail.com"]
  end
end

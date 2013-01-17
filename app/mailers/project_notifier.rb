class ProjectNotifier < ActionMailer::Base
  default from: "revdom2@mail.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_notifier.invite.subject
  #
  def invite(response, user)
    @user = user
    @response = response
    @greeting = "Hi"

    mail to: @user.email
  end
end

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["GMAIL_USERNAME"],
  :password => ENV["GMAIL_PASSWORD"],
  :address => "smtp.gmail.com",
  :port => 587,
  :tls => true
}
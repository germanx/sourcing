class MailgunController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def post
    # process various message parameters:
     sender  = params['from']
     subject = params['subject']

     # get the "stripped" body of the message, i.e. without
     # the quoted part
     actual_body = params["stripped-text"]

     # process all attachments:
     count = params['attachment-count'].to_i
     
     puts "sender: #{sender}, subject: #{subject}, attach count: #{count}"
     puts "body: #{actual_body}"
     puts "params: #{params}"

     count.times do |i|
       stream = params["attachment-#{i+1}"]
       filename = stream.original_filename
       data = stream.read()

       puts "filename: #{filename}"
     end
     render :text => "OK"
  end
end

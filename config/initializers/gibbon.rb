#require 'digest'

#Gibbon::Request.new(api_key: ENV["MAILCHIMP_API_KEY"])
#Gibbon::Request.timeout = 15
#Gibbon::Request.throws_exceptions = true
#puts "MailChimp API key: #{Gibbon::Request.api_key}" # temporary

# temporary
#gb = Gibbon::Request

#Display the list ENV["MAILCHIMP_LIST_ID"]
#puts gb.lists(ENV["MAILCHIMP_LIST_ID"]).members.retrieve.inspect

#puts "#"*20

#Display a specific user of list ENV["MAILCHIMP_LIST_ID"]
#mail = 'david.gerard.42@gmail.com'
#lower_case_md5_hashed_email_address = Digest::MD5.hexdigest(mail.downcase)
#puts "MailChimp user #{mail} :" # temporary
#puts gb.lists(ENV["MAILCHIMP_LIST_ID"]).members(lower_case_md5_hashed_email_address).retrieve.inspect

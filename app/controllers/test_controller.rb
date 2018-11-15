class TestController < ApplicationController
  
  def index
  end

  def send_nl

    User.all.each do |user|

      puts "#"*30
      puts user.first_name

      email = { :from_email   => "thp.formation.42@gmail.com",
        :from_name    => "THP",
        :subject      => "Newsletter THP",
        :text_part    => "Bonjour #{user.first_name}, Voici la newsletter :) : ... ",
        :recipients   => [{:email => user.email}] }
  
      test = Mailjet::Send.create(email)
  
      # retrieve the API response
      #p test.attributes['Sent']

    end

    redirect_to root_path


  end

end

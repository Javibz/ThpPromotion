class SaveScrappController < ApplicationController

  def scrap

  	# Création et enregistrement de la table "Email" en utilisant le scrapping

  	@scrapp = ScrappMail.new.perform_herault

		@scrapp.each do |k, v|
			if (Email.find_by(email: v[1]))
				Email.find_by(email: v[1]).update(designation: "Mairie", name: "#{k}")
			else
				 @save_email_mairie = Email.create(designation: "Mairie", name: "#{k}", email: "#{v[1]}")
			end
		end
		
		redirect_to profile_path

	end
	

	def handle
		# Création et enregistrement de la table "Handle" en utilisant le bot twitter

		@all_name = []
		@find_all_name = Email.all

		@find_all_name.each do |element|
			@all_name << element.name
		end

		@handle = BotTwitter.new(@all_name)
		@names_handles = @handle.find_handle
		@test = []
		@names_handles.each do |element|
			Handle.create(name: "#{element}", email_id: rand(Email.first.id..Email.last.id))
		end

		redirect_to profile_path

	end

end

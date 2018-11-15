require 'nokogiri'
require 'open-uri'

class ScrappMail
		  #...................................hérault.......................................#

  #DECLARATION DE LA METHODE = SEARCH EMAIL
    def get_email_herault (url)
      page = open(url).read
      nokogiri_object = Nokogiri::HTML(page)
      email_herault = nokogiri_object.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
      puts email_herault.text
      return email_herault.text
    end

  #DECLARATION DE LA METHODE = SEARCH NAME
    def get_name_herault (url)
      page = open(url).read
      nokogiri_object = Nokogiri::HTML(page)
      name_herault = nokogiri_object.xpath("/html/body/div/main/section[1]/div/div/div/h1")
      puts name_herault.text
      return name_herault.text
    end

  #DECLARATION DE LA METHODE = SEARCH URL
    def get_url_herault (url)
      web_links = Nokogiri::HTML(open(url).read)
      web_object = web_links.css("a")
      array = []
      web_object.each {|link| array << link["href"]}
      #grep : isole les elements contenant ces caracteres
      tab = array.grep(/.*34/)
      #construction du nouvel url :
      tab.map {|i| i[0]= "" + "http://annuaire-des-mairies.com"}
      return tab
    end

  #DECLARATION DE LA METHODE = PERFORM
    def perform_herault

      tabmail = [] #creation d'array pour le hash
      tabname = [] # //

      # insertion d'eletab_name_mairie << kments dans l'array [tabmail]
      get_url_herault("http://annuaire-des-mairies.com/herault.html").each do |url_town|
          tabmail << get_email_herault(url_town)
      end

      # insertion d'elements dans l'array [tabname]
      get_url_herault("http://annuaire-des-mairies.com/herault.html").each do |url_town|
          tabname << get_name_herault(url_town)
      end

      # creation du hash
      my_hash = Hash[tabname.zip(tabmail)]

      hash_herault = Hash.new
      tab_mails = []
      my_hash.each do |key, value|
        index_fin = (key =~ / - /)
        name = key[0...index_fin]
        hash_herault[name] = [34, value]
      end
        return hash_herault
    end

end


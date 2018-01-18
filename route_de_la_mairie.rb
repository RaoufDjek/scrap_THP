#initialisation avec les trois packages nécessaires
require 'rubygems'
require 'open-uri'
require 'nokogiri'


@citylist = [] #initialisation de l'array de la liste des noms des villes
@city_email = [] #initialisation de l'array de la liste des emails
@result = {} #initialisation du hash avec les villes et emails
@compteur = 0


def get_all_the_urls_of_val_doise_townhalls #methode qui va récupérer tout les url des mairies du val d'oise

doc = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html")) #démarre la lecture du site
    
    doc.xpath('//a[@class="lientxt"]').each do |city| #on fait une boucle pour chaque nom de mairie récupéré
    	@citylist << city.text #je  stock dans l'array citylist tout les noms de mairie
    
	end
# puts citylist
 get_the_email_of_a_townhal_from_its_webpage(@citylist) #j'appelle la méthode pour récuperer les emails sur les pages
end


 def get_the_email_of_a_townhal_from_its_webpage(cities) #méthode qui récupere l'email sur la page
		
		cities.each do |city| #je réitere pour chaque valeur de l'array contenant les noms de ville
			city_downcase = city.downcase.gsub(" ","-") #pour les inserer dans les url, je met les noms des mairies en minuscule et je remplace l'espace par un tiret 
			doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{city_downcase}.html")) #on démarre la lecture du site contenant le nom d'une mairie
			
			@city_email << doc.css('p:contains("@")').text.gsub(' ','') #je récupère les élèments ayant des @ soit les emails, je clean en gardant que le texte et sans espaces puis je le stock dans l'autre array city_email
			@compteur += 1 #compteur pour synchroniser les emails avec les noms des villes
		end

	 for i in 0 .. @compteur-1 do #on initialise une boucle qui va etre executé le nombre de fois qu'il y a de mairies
	 		@result[@citylist[i]]=@city_email[i] #on entre dans le hash final chaque mairie avec son email
	 end

	 puts @result #on affiche le hash final
end

get_all_the_urls_of_val_doise_townhalls() #on lance la méthode


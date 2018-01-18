#initialisation
require 'rubygems'
require 'open-uri'
require 'nokogiri'

def get_the_email_of_a_townhal_from_its_webpage()
doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	 
puts doc.css('p:contains("@")').text.gsub(' ','')
end


get_the_email_of_a_townhal_from_its_webpage()
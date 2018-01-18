	require 'open-uri'
	require 'nokogiri'

	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	doc.xpath("/html[1]/body[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[1]/td[1]/table[4]/tbody[1]/tr[2]/td[1]/table[1]/tbody[1]/tr[5]/td[2]/p[1]/font[1]").each do |node|
	  puts node.text
	end
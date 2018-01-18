require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/HTML"))   
puts page.class   # => Nokogiri::HTML::Document

links = page.css("a")
page.css( table:nth-child(1) tbody:nth-child(1) tr:nth-child(5) td.style27 > p.Style22).each do |el|
   puts el.text
end
#mw-content-text > div > table.infobox > tbody > tr:nth-child(7) > th
#mw-content-text > div > table.infobox > tbody > tr:nth-child(2) > th
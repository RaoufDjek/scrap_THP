require 'rubygems'
require 'nokogiri'
require 'open-uri'
result = []
doc = Nokogiri::HTML(open("http://mon-incubateur.com/site_incubateur/incubateurs"))

result = doc.css("div#incubators_list table p a")
puts result
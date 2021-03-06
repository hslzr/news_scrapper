require 'bundler'
require 'rss'
require 'open-uri'
require 'active_support/all'

Bundler.require(:default)
Dir['./newspapers/*.rb'].each {|file| require file}


articles = Newspaper::Expansion.articles

print ""

articles.each do |article|
  puts "-> #{article[:title]}"
  puts "#{article[:pub_date]} -- #{article[:link]}"
  puts "#{article[:description]}"
  puts " "
end

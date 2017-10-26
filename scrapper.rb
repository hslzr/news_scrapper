require 'bundler'
require 'active_support/all'
Bundler.require(:default)
Dir['./newspapers/*.rb'].each {|file| require file}

articles = Newspaper::Financiero.articles

print ""

articles.each do |article|
  puts "-> #{article[:title]}"
  puts "#{article[:pub_date]} -- #{article[:link]}"
  puts "#{article[:description]}"
  puts " "
end

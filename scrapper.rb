require 'bundler'
Bundler.require(:default)

puts "========== EL FINANCIERO ============="
# Starting with El financiero

print "Cargando...\r"

page = HTTParty.get('http://www.elfinanciero.com.mx/rss/')
document = Nokogiri::XML(page.body)
print ""
# Only the first 10 articles
raw_articles = document.xpath('//item')[0..9]

articles = []

articles.each do |article|
  title = article.children[1].children.text
  description = article.children[3].children.text
  pub_date = article.children[5].children.text

  puts "-> #{title}"
  puts "-- #{pub_date}"
  puts "#{description}"
  puts " "
end

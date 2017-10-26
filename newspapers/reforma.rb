module Newspaper
  module Reforma
    Url = 'http://www.reforma.com/rss/portada.xml'.freeze

    def self.articles
      page = page_contents
      raw_articles = page.xpath('//item')[0..9]
      binding.pry
      articles = raw_articles.map do |article|
        article = clean(article)
        { title: article[1].children.text,
          description: article[5].children.text,
          pub_date: parse_datetime(article[4].children.text),
          link: article[2].children.text }
      end
    end

    def self.parse_datetime(string)
      date = DateTime.parse(string)
      date = date.in_time_zone('America/Monterrey')
      date.strftime("Publicado el %d/%m/%Y, %H:%M")
    end

    def self.page_contents
      raw_page = HTTParty.get(Url)
      Nokogiri::XML(raw_page.body)
    end

    def self.clean(raw_article)
      raw_article.children.reject{|child| child.to_s.gsub(/\n\s+/, '').blank?}
    end
  end
end

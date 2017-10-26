module Newspaper
  module Financiero
    Url = 'http://www.elfinanciero.com.mx/rss/'.freeze

    def self.articles
      page = page_contents
      raw_articles = page.xpath('//item')[0..9]
      articles = raw_articles.map do |article|
        { title: article.children[1].children.text,
          description: article.children[3].children.text,
          pub_date: parse_datetime(article.children[5].children.text),
          link: article.children[7].children.text }
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
  end
end

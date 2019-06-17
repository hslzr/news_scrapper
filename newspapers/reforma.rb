module Newspaper
  module Reforma
    URL = 'http://www.reforma.com/rss/portada.xml'.freeze

    def self.articles
      articles = []
      open(URL) do |rss|
        feed = RSS::Parser.parse(rss)
        articles = feed.items.map do |item|
          { title: item.title,
            description: item.description,
            link: item.link,
            pub_date: parse_datetime(item.pubDate) }
        end
      end
      articles
    end

    def self.parse_datetime(pubDate)
      date = pubDate
      date.strftime("Publicado el %d/%m/%Y, %H:%M")
    end
  end
end

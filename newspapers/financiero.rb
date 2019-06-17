module Newspaper
  module Financiero
    URL = 'http://www.elfinanciero.com.mx/rss/'.freeze

    def self.articles
      articles = []
      open(URL) do |rss|
        feed = RSS::Parser.parse(rss)
        articles = feed.items.map do |item|
          { title: item.title,
            description: item.description,
            pub_date: parse_datetime(item.pubDate),
            link: item.link }
        end
      end
      articles
    end

    def self.parse_datetime(pubDate)
      date = pubDate
      date = date.in_time_zone('America/Monterrey')
      date.strftime("Publicado el %d/%m/%Y, %H:%M")
    end
  end
end

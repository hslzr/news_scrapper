module Newspaper
  module Expansion
    Url = 'http://estaticos.expansion.com/rss/portada.xml'.freeze

    def self.articles
      articles = []
      open(Url) do |rss|
        feed = RSS::Parser.parse(rss)
        articles = feed.items.map do |item|
          { title: item.title,
            description: parse_description(item.description),
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

    def self.parse_description(string)
      string.gsub(/<\/?[^>]+?>/, '').gsub(/\n/, '').gsub(/\&nbsp;Leer$/, '')
    end
  end
end

# News Scrapper

~Simple web scrapping tool for some MX newspapers.~ Turns out this is just a really simple RSS Reader. 
I was not aware of ruby's [RSS Parser library](https://ruby-doc.org/stdlib-2.4.1/libdoc/rss/rdoc/RSS.html) so it 
really rendered my 'scrapping idea' to dust.

This is insightful, however; I might turn this into a gem or something. Idk yet.

### Getting started

```sh
$ git clone git@github.com:hslzr/news_scrapper.git

$ cd news_scrapper

$ docker build . -t news_scrapper
```

### Run the project

```sh
docker run \
--interactive --tty --rm \
--volume /var/run/docker.sock:/var/run/docker.sock \
--volume "$PWD":/usr/src/app \
news_scrapper
```

### Contributing

Plz don't

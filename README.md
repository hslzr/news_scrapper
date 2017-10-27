# News Scrapper

Simple web scrapping tool for some MX newspapers.

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

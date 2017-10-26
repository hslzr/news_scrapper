FROM ruby:2.4.1-slim
LABEL maintainer "Héctor Salazar <hector@hslzr.com>"

RUN apt-get -qq update && apt-get -qq install -y \
    --no-install-recommends build-essential

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN gem install --no-ri --no-rdoc bundler

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j10

CMD ["ruby", "scrapper.rb"]

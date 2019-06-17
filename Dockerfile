FROM ruby:2.6.3-slim
LABEL maintainer "Héctor Salazar <hector@hslzr.com>"

RUN apt-get -qq update && apt-get -qq install -y \
    --no-install-recommends build-essential

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# JIT compiler for Ruby 2.6
ENV RUBY_OPT=--jit

RUN gem install bundler

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j10

CMD ["ruby", "scrapper.rb"]

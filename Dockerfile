FROM ruby:2.6.0-slim
MAINTAINER KasaHNO3 <umbrella.hsiao@gmail.com>
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs vim
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler -v '2.3.11'
RUN bundle install
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

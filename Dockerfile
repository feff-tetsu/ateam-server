FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /ateam
WORKDIR /ateam
ADD Gemfile /ateam/Gemfile
ADD Gemfile.lock /ateam/Gemfile.lock
RUN bundle install
ADD . /myapp
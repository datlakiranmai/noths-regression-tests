FROM ruby:2.4

ENV HOME /service
WORKDIR $HOME

RUN apt-get update -qq && apt-get install -y build-essential
COPY Gemfile* $HOME/
RUN bundle install
COPY . $HOME

# Base the image off of the latest pre-built ruby image
FROM hub.noths.com/ruby:2.4
ENV DEBIAN_FRONTEND noninteractive
# make and switch to the /code directory which will hold the tests

RUN apt-get update \
    && apt-get -y install wget \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && apt-get update \
    && apt-get -y install google-chrome-stable xvfb

WORKDIR /service

# move over the Gemfile and Gemfile.lock before the rest so that we can cache the installed gems
ADD Gemfile /service/Gemfile
ADD Gemfile.lock /service/Gemfile.lock

# upgrade to latest version of bundler and install all the gems specified by the gemfile
RUN gem install bundler -v 1.13.6 \
    && bundle install


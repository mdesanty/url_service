FROM alpine:3.2 
MAINTAINER Michael DeSanty <michael.desanty@drivedominion.com>

RUN apk update && apk upgrade && apk add ruby=2.2.3-r0 ruby-bundler=1.10.5-r0 ruby-io-console ruby-dev build-base bash
RUN rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /app/

COPY . /usr/app
RUN bundle install

EXPOSE 5000
CMD ["bundle", "exec", "ruby", "api/url.rb"]

FROM alpine:latest
RUN apk update && apk upgrade && apk add curl wget bash
RUN apk add ruby ruby-io-console ruby-bundler ruby-json ruby-test-unit
RUN rm -rf /var/cache/apk/*
RUN mkdir /usr/app
RUN mkdir /usr/app/Models
RUN mkdir /usr/app/Data
RUN mkdir /usr/app/Tests
RUN mkdir /usr/app/Tests/Unit
WORKDIR /usr/app
COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
COPY Models/Checkout.rb /usr/app/Models
COPY Tests/Unit/CheckoutTest.rb /usr/app/Tests/Unit
COPY Data/pricing_rules.json /usr/app/Data
RUN bundle install
COPY . /usr/app
RUN rm -rf /var/cache/apk/*
ENTRYPOINT ["ruby", "main.rb"]
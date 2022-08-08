FROM ruby:3.1.2-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN bundle

CMD ["ruby", "app.rb"]
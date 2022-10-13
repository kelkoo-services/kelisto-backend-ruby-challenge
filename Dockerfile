FROM ruby:3.1-alpine

COPY . .

# RUN bundle install --binstubs
RUN bundle install
RUN bundle binstubs --all

# CMD bin/rspec
CMD irb -r ./src/cart.rb

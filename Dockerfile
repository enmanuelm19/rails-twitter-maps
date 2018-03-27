FROM ruby:2.3.1
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /rails-twitter-maps
WORKDIR ./rails-twitter-maps
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --without production test
COPY . ./
EXPOSE 3000
ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]

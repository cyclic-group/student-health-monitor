ARG RUBY_VERSION=3.1.2
FROM ruby:${RUBY_VERSION}

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app 
WORKDIR /app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install 

ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_DB_HOST="db" \
    RAILS_DB_USERNAME="postgres"

ENTRYPOINT [ "./bin/docker-entrypoint" ]

EXPOSE 3000

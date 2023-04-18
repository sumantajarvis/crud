FROM ruby:3.0.5

RUN apt-get install -y libxml2-dev libxslt1-dev
RUN apt-get install -y zlib1g-dev liblzma-dev patch

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt install nodejs -y

RUN apt-get update
#ENV RAILS_ENV=production
#ENV RACK_ENV=production
#ARG _RAILS_MASTER_KEY
#ENV RAILS_MASTER_KEY=$_RAILS_MASTER_KEY
ARG _ACCESS_TOKEN
ENV ACCESS_TOKEN=$_ACCESS_TOKEN

WORKDIR /app/crud/

COPY Gemfile Gemfile
#COPY Gemfile.lock Gemfile.lock
RUN bundle config github.com $ACCESS_TOKEN
COPY . .
#RUN chmod +x entrypoint.sh
#COPY .env.example .env
RUN bundle install
RUN bundle add redis
#RUN bundle update saral-locatable
#RUN rails webpacker:install
RUN bundle exec rails assets:precompile
#ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000

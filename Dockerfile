FROM ruby:2.2

ENV APP_HOME /home/app

RUN adduser app --home $APP_HOME --shell /bin/bash --disabled-password --gecos ""

ADD Gemfile      $APP_HOME/
ADD Gemfile.lock $APP_HOME/

RUN mkdir -p /var/bundle && chown -R app:app /var/bundle /usr/local/bundle

# USER app
WORKDIR /home/app

RUN cd $APP_HOME && bundle install --deployment --path /var/bundle

ADD . $APP_HOME
# USER root
RUN chown -R app:app $APP_HOME

EXPOSE 3000

# USER app

ENV RAILS_ENV development
CMD bundle exec rails server

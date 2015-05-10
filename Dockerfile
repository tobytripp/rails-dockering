FROM ruby:2.2.2

RUN adduser app --home /home/app --shell /bin/bash --disabled-password --gecos ""

ADD Gemfile      /home/app/
ADD Gemfile.lock /home/app/

RUN mkdir -p /var/bundle && chown -R app:app /var/bundle /usr/local/bundle

USER app
WORKDIR /home/app

RUN cd /home/app && bundle install --deployment --path /var/bundle

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server"]

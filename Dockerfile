FROM ruby:alpine@sha256:e284f39a2103a564dca9771a81bfecb455b04cd3be4149b133ed7e508ef1b65f

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN apk --update add build-base \
  && bundle install \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

EXPOSE 4000

CMD [ "bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]


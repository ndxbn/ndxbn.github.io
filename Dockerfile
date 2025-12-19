FROM ruby:alpine@sha256:bb36e2a845bc692f42650d51266c6500e3792c9b99d591e15d0ab6a1d7e2965d

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN apk --update add build-base \
  && bundle install \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

EXPOSE 4000

CMD [ "bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]


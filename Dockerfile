FROM ruby:alpine@sha256:885df0ba684eb6302aae26bb00575858b389256da6102c673a8a883be34a2c4c

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN apk --update add build-base \
  && bundle install \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

EXPOSE 4000

CMD [ "bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]


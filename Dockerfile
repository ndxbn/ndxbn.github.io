FROM ruby:alpine@sha256:d594d5debffa14c591c4fe03b9d0d79cdc28f30d594f47be748e642746057fec

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN apk --update add build-base \
  && bundle install \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

EXPOSE 4000

CMD [ "bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]


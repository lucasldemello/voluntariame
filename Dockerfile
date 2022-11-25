FROM ruby:3.1.2

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qy && apt-get install -y apt-transport-https
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -y \
 && apt-get install -y -q \
    build-essential \
    apt-transport-https \
    ca-certificates \
    nodejs \ 
    yarn \
    libpq-dev \
    default-mysql-client \
    vim \
    htop \
 && apt-get clean \
 && rm -f /var/lib/apt/lists/*_*

RUN mkdir /voluntariarme
WORKDIR /voluntariarme

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install

COPY . .

EXPOSE 3000
EXPOSE 3001
EXPOSE 3003
EXPOSE 11211

ENV RAILS_ENV development

ENTRYPOINT ["sh", "./entrypoint.sh"]
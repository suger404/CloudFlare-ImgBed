FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

RUN git clone https://github.com/cf-pages/Telegraph-Image .

RUN npm install
RUN npm install -g wrangler

ENV BASIC_USER=admin
ENV BASIC_PASS=123

EXPOSE 8080

RUN mkdir data

CMD ["wrangler", "pages", "dev", "./", "--kv", "img_url", "--port", "8080", "--binding", "BASIC_USER=${BASIC_USER}", "--binding", "BASIC_PASS=${BASIC_PASS}", "--persist-to", "./data", "--log-level", "debug"]

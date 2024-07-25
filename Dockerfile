FROM node:16

WORKDIR /app

RUN git clone https://github.com/cf-pages/Telegraph-Image .

RUN npm install
RUN npm install -g wrangler

ENV BASIC_USER=admin
ENV BASIC_PASS=123

EXPOSE 8080

RUN mkdir data

# 添加调试信息
RUN wrangler --version
RUN node --version

CMD ["sh", "-c", "wrangler pages dev ./ --kv \"img_url\" --port 8080 --binding BASIC_USER=${BASIC_USER} --binding BASIC_PASS=${BASIC_PASS} --persist-to ./data --log-level debug"]

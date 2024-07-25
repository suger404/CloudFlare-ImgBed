FROM node:16

WORKDIR /app

RUN git clone https://github.com/cf-pages/Telegraph-Image .

RUN npm install

ENV BASIC_USER=admin
ENV BASIC_PASS=123
ENV PORT=8080

EXPOSE 8080

RUN mkdir data

# 使用 node 直接运行项目
CMD ["node", "index.js"]

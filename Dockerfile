# 使用 Node.js 作为基础镜像
FROM node:16

# 设置工作目录
WORKDIR /app

# 克隆代码
RUN git clone https://github.com/cf-pages/Telegraph-Image .

# 安装依赖
RUN npm install
RUN npm install -g wrangler

# 设置环境变量
ENV BASIC_USER=admin
ENV BASIC_PASS=123
ENV AUTH_CODE=123123

# 暴露端口
EXPOSE 8080

# 创建数据持久化目录
RUN mkdir data

# 运行应用
CMD ["wrangler", "pages", "dev", "./", "--kv", "img_url", "--port", "8080", "--binding", "BASIC_USER=${BASIC_USER}", "--binding", "BASIC_PASS=${BASIC_PASS}", "--persist-to", "./data", "--log-level", "none"]

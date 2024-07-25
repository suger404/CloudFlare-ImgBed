FROM ubuntu:20.04

# 避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表并安装必要的软件
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# 安装 Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y nodejs

WORKDIR /app

# 克隆项目
RUN git clone https://github.com/candies404/CloudFlare-ImgBed .

# 安装项目依赖
RUN npm install

# 全局安装 wrangler
RUN npm install -g wrangler

# 设置环境变量
ENV BASIC_USER=admin
ENV BASIC_PASS=123

# 暴露端口
EXPOSE 8080

# 创建数据目录
RUN mkdir data

# 运行命令
CMD ["wrangler", "pages", "dev", "./", "--kv", "img_url", "--port", "8080", "--binding", "BASIC_USER=${BASIC_USER}", "--binding", "BASIC_PASS=${BASIC_PASS}", "--persist-to", "./data", "--log-level", "debug"]

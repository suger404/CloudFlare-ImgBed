FROM ubuntu:20.04  # 选择一个含有 GLIBC 2.29 的系统

# 安装 Node.js 和必要工具
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -  # 使用 Node.js 16.x
RUN apt-get install -y nodejs

# 复制你的项目文件到容器中
COPY . /app
WORKDIR /app

# 安装依赖并运行你的项目
RUN npm install
CMD ["npm", "run", "start"]

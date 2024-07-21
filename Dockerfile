# 使用支持 GLIBC 2.29 的基础镜像
FROM ubuntu:20.04

# 安装 Node.js 和必要的依赖
RUN apt-get update && apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# 设置工作目录
WORKDIR /app

# 将本地代码复制到容器中
COPY . .

# 安装项目依赖
RUN npm install

# 运行项目
CMD ["npm", "run", "start"]

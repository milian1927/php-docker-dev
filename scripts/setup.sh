#!/bin/bash

# 初始化环境脚本
echo "正在初始化开发环境..."

# 启动 Docker 容器
docker-compose -f /php-docker-dev/compose-dockerfiles/docker-compose.yml up -d php nginx --build

# 创建数据库
#echo "正在创建数据库..."
#docker exec -it mysql-container mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS laravel_db;"

# 设置 Nginx 配置
#echo "启用 Nginx 配置..."
#ln -s /php-docker-dev/nginx/sites-available/project1.conf /php-docker-dev/nginx/sites-enabled/project1.conf

# 重启 Nginx
docker exec nginx nginx -s reload

echo "环境初始化完成！"

#!/bin/bash

# 添加新项目脚本
if [ -z "$1" ]; then
  echo "请提供项目名称！"
  exit 1
fi

PROJECT_NAME=$1

# 创建项目目录
echo "正在创建项目目录：$PROJECT_NAME"
mkdir -p ./src/$PROJECT_NAME

# 复制默认配置
echo "正在复制默认配置文件..."
cp ./nginx/sites-available/project1 ./nginx/sites-available/$PROJECT_NAME

# 更新 Nginx 配置中的项目名称
sed -i "s/project1.local/$PROJECT_NAME.local/" ./nginx/sites-available/$PROJECT_NAME

# 启用新配置
ln -s /etc/nginx/sites-available/$PROJECT_NAME /etc/nginx/sites-enabled/

# 重启 Nginx
docker exec nginx-container nginx -s reload

echo "项目 $PROJECT_NAME 已添加并配置完成！"

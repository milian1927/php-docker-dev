FROM php:8.0-fpm

# 设置容器时区和宿主机相同
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 更新并安装依赖包和 PHP 核心扩展
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo_mysql opcache mysqli \
    && rm -r /var/lib/apt/lists/*

# 安装缺少的扩展（通过 PECL 安装）
RUN pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug

# 设置工作目录
WORKDIR /var/www/html

# 设置权限
RUN usermod -u 1000 www-data

# 删除临时缓存
RUN rm -rf /tmp/*

# 默认命令（可以根据需要更改）
CMD ["php-fpm"]


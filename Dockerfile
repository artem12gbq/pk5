FROM php:8.2-apache

# 1. Устанавливаем системные зависимости для Composer (zip, git)
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git

# 2. Копируем сам бинарник Composer из официального образа
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 3. Копируем код
COPY src/ /var/www/html/

# 4. Включаем rewrite (как у вас уже было)
RUN a2enmod rewrite

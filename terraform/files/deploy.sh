#!/bin/bash

set -e
APP_DIR=${1:-$HOME}

# Функция для выполнения команды с повторной попыткой
retry() {
  local n=1
  local max=5
  local delay=5
  while true; do
    "$@" && break || {
      if [[ $n -lt $max ]]; then
        ((n++))
        echo "Команда не удалась. Повторная попытка $n из $max через $delay секунд..."
        sleep $delay
      else
        echo "Команда потерпела неудачу после $n попыток."
        return 1
      fi
    }
  done
}

# Установка зависимостей с повторной попыткой
retry sudo apt-get update
retry sudo apt-get install -y git

# Клонирование репозитория и установка зависимостей
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install

# Настройка сервиса puma
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma


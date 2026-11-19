#!/bin/bash
set -e

# 1. Обновление системы и установка базовых пакетов
sudo apt update
sudo apt install -y ca-certificates curl

# 2. Создание директории и сохранение GPG-ключа Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 3. Автоматическое добавление репозитория под вашу версию Ubuntu
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Установка Docker Engine и плагинов
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 5. Добавление текущего пользователя в группу docker, чтоб всегда не писать sudo
sudo usermod -aG docker $USER
# после завершения скрипта в терминал отправить su - ${USER}

# 6. Проверка установки
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker --no-pager
echo "Установка завершена успешно!"

# 7. Установка micro-ROS-agent
sudo docker pull microros/micro-ros-agent:jazzy
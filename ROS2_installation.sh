#!/bin/bash
set -e

# 1. Настройка системной локали en_US.UTF-8

sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# 2. Подключение необходимых репозиториев

sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt update && sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -fsSL -o /dev/null -w '%{url_effective}' https://github.com/ros-infrastructure/ros-apt-source/releases/latest | awk -F/ '{print $NF}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb

# 3. Установка ROS2 Jazzy

# Устанавливаются сразу инструменты разработки(RViz2, rqt), учебные симуляторы(Turtlesim) и системные библиотеки(tf2)
sudo apt update && sudo apt upgrade -y && sudo apt install ros-jazzy-desktop ros-dev-tools -y

# Облегченная версия (ros-base): только ядро, библиотеки связи и tf2 (без GUI, RViz2, rqt и Turtlesim).
# Подходит для бортовых компьютеров (Raspberry Pi, Jetson) и при нехватке места.
# Чтобы выбрать её, поставьте # в начале команды выше и уберите # в строке ниже:

#sudo apt update && sudo apt upgrade -y && sudo apt install ros-jazzy-ros-base ros-dev-tools -y
sudo apt install python3-colcon-common-extensions -y

# 4. Настройка автозапуска окружения и проверка установки

grep -Fxq "source /opt/ros/jazzy/setup.bash" ~/.bashrc || echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
source /opt/ros/jazzy/setup.bash
echo "Установленна версия: $ROS_DISTRO"

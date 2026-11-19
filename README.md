Файлы для быстрого скачивания ROS2, Docker и запуска micro-ROS agent
## Установка ROS2
# Скачайте файл в терминале: 
```bash
wget
chmod +x ROS2_installation.sh
./ROS2_installation.sh
```
Если вам нужна Облегченная версия (ros-base): только ядро, библиотеки связи и tf2 (без GUI, RViz2, rqt и Turtlesim), то зайдите в файл и сделайте, что в нем написано:
```bash
#sudo apt update && sudo apt upgrade -y && sudo apt install ros-jazzy-desktop ros-dev-tools -y

# Облегченная версия (ros-base): только ядро, библиотеки связи и tf2 (без GUI, RViz2, rqt и Turtlesim).
# Подходит для бортовых компьютеров (Raspberry Pi, Jetson) и при нехватке места.
# Чтобы выбрать её, поставьте # в начале команды выше и уберите # в строке ниже:
sudo apt update && sudo apt upgrade -y && sudo apt install ros-jazzy-ros-base ros-dev-tools -y
```
## Установка Docker и micro-ROS Agent (Jazzy)
# Скачайте файл в терминале: 
```bash
wget
chmod +x docker_microROS_installation.sh
./docker_microROS_installation.sh
```
# После установки выполните команду: 
```bash
su - ${USER}
```
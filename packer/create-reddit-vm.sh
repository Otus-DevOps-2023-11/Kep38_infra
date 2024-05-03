#!/bin/bash

# Параметры
FOLDER_ID="your_folder_id"
SUBNET_ID="your_subnet_id"
IMAGE_ID="your_image_id"
DISK_SIZE="20"  # Размер диска в ГБ
ZONE="ru-central1-a"  # Зона, где будет создана ВМ
VM_NAME="reddit-vm"
PUBLIC_IP="true"  # Использовать ли публичный IP для ВМ (true/false)
SSH_PUBLIC_KEY="your_ssh_public_key"

# Создание ВМ
yc compute instance create \
  --name=$VM_NAME \
  --zone=$ZONE \
  --hostname=$VM_NAME \
  --memory=2 \
  --cores=2 \
  --core-fraction=25 \
  --public-ip=$PUBLIC_IP \
  --create-boot-disk image-family=$IMAGE_ID,size=$DISK_SIZEGB \
  --ssh-key=$SSH_PUBLIC_KEY \
  --folder-id=$FOLDER_ID \
  --subnet-id=$SUBNET_ID

# Проверка статуса создания ВМ
if [ $? -eq 0 ]; then
  echo "Виртуальная машина успешно создана."
else
  echo "Ошибка при создании виртуальной машины."
fi

